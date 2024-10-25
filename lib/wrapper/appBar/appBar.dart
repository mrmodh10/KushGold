import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kushgold_web/wrapper/responsive/bloc/responsiveBloc.dart';
import 'package:kushgold_web/wrapper/responsive/bloc/responsiveBlocState.dart';
import '../../const/imageAssert.dart';
import '../padding/screenPadding.dart';

PreferredSize appBar({required BuildContext context}) {
  final theme = Theme.of(context);
  ResponsiveBloc responsiveBloc = context.read<ResponsiveBloc>();
  return PreferredSize(
      preferredSize:
          Size.fromHeight(responsiveBloc.constraints.maxHeight * 0.2),
      child: BlocBuilder<ResponsiveBloc, ResponsiveBlocState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    color: theme.colorScheme.onPrimaryContainer,
                    child: createPriceBar(context: context),
                  )),
              Expanded(
                  flex: 8,
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    margin: EdgeInsets.zero,
                    color: theme.colorScheme.surfaceContainerLowest,
                    child: createSearchBar(
                        context: context, responsiveBloc: responsiveBloc),
                  )),
            ],
          );
        },
      ));
}

Widget createSearchBar(
    {required BuildContext context, required ResponsiveBloc responsiveBloc}) {
  final theme = Theme.of(context);
  return Padding(
    padding: const EdgeInsets.only(top: 5),
    child: Row(
      mainAxisAlignment: responsiveBloc.constraints.maxWidth < 1000
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Image.asset(IconAssert.appIcon),
            ),
            AutoSizeText(
              "Kush Gold",
              style: theme.textTheme.titleLarge?.apply(
                  color: theme.colorScheme.onPrimaryFixed, fontWeightDelta: 8),
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        responsiveBloc.isLarge
            ? SizedBox(
            width: responsiveBloc.constraints.maxWidth *
                (responsiveBloc.constraints.maxWidth < 1400 ? 0.5 : 0.6),
            child: buildSearchBar(responsiveBloc))
            : Container(),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            TextButton.icon(
              onPressed: () {},
              label: responsiveBloc.isSmall
                  ? SizedBox()
                  : Text(
                      "Login",
                      style: theme.textTheme.titleLarge?.apply(
                          color: theme.colorScheme.onPrimaryFixed,
                          fontWeightDelta: 8),
                    ),
              icon: Icon(
                size: 25,
                Icons.account_circle_outlined,
                color: theme.colorScheme.onPrimaryFixed,
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              label: responsiveBloc.isSmall
                  ? SizedBox()
                  : Text(
                      "Cart",
                      style: theme.textTheme.titleLarge?.apply(
                          color: theme.colorScheme.onPrimaryFixed,
                          fontWeightDelta: 8),
                    ),
              icon: Icon(
                size: 25,
                Icons.shopping_cart_outlined,
                color: theme.colorScheme.onPrimaryFixed,
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget buildSearchBar(ResponsiveBloc responsiveBloc) {
  return Stack(
    children: [
      TextFormField(
        controller: TextEditingController(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          hintText: 'Search for a product',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      Positioned(
        right: 0,
        top: 0,
        bottom: 0,
        child: Padding(
          padding: EdgeInsets.all(2),
          child: FilledButton.tonal(
              style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero))),
              onPressed: () {},
              child: AutoSizeText("SEARCH")),
        ),
      )
    ],
  );
}

Widget createPriceBar({required BuildContext context}) {
  return customPadding(
    child: ListView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      children: [
        createPriceBarWidget(
            context: context,
            metalName: "GOLD",
            isSuccess: true,
            metalPrice: "2,1990",
            updatedPrice: "19.20"),
        SizedBox(
          width: 20,
        ),
        createPriceBarWidget(
            context: context,
            metalName: "SILVER",
            isSuccess: false,
            metalPrice: "2,1990",
            updatedPrice: "19.20"),
        SizedBox(
          width: 20,
        ),
        createPriceBarWidget(
            context: context,
            metalName: "PLATINUM",
            isSuccess: true,
            metalPrice: "2,1990",
            updatedPrice: "19.20"),
        SizedBox(
          width: 20,
        ),
        createPriceBarWidget(
            context: context,
            metalName: "PALLADIUM",
            isSuccess: false,
            metalPrice: "2,1990",
            updatedPrice: "19.20")
      ],
    ),
  );
}

Widget createPriceBarWidget(
    {required BuildContext context,
    required String metalName,
    required String metalPrice,
    required String updatedPrice,
    required bool isSuccess}) {
  final theme = Theme.of(context);
  return Row(
    children: [
      AutoSizeText(
        ' ${metalName} \$${metalPrice} ',
        style: theme.textTheme.titleMedium?.apply(
            color: theme.colorScheme.surfaceContainerLowest,
            fontWeightDelta: 0),
      ),
      SizedBox(
        width: 5,
      ),
      Icon(
          isSuccess
              ? Icons.arrow_circle_up_sharp
              : Icons.arrow_circle_down_sharp,
          color: isSuccess ? Colors.green : theme.colorScheme.error),
      AutoSizeText(
        ' \$${updatedPrice} ',
        style: theme.textTheme.titleMedium
            ?.apply(color: isSuccess ? Colors.green : theme.colorScheme.error),
      ),
    ],
  );
}
