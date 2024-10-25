import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kushgold_web/wrapper/padding/screenPadding.dart';
import 'package:kushgold_web/wrapper/responsive/bloc/responsiveBloc.dart';
import 'package:kushgold_web/wrapper/responsive/bloc/responsiveBlocState.dart';

import '../../wrapper/appBar/appBar.dart';
import '../../wrapper/responsive/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsiveBloc responsiveBloc = context.read<ResponsiveBloc>();
    return Scaffold(appBar: appBar(context: context), body: customPadding(
      child:
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: BlocBuilder<ResponsiveBloc, ResponsiveBlocState>(
          builder: (context, state) {
            return Column(
              children: [
                responsiveBloc.isLarge?Container():Align(
                    alignment: Alignment.center,
                    child: buildSearchBar(responsiveBloc))
              ],
            );
          },
        ),
      ),
    ));
  }
}
