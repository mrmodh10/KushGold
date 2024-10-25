import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kushgold_web/wrapper/appBar/appBar.dart';
import 'package:kushgold_web/wrapper/responsive/bloc/responsiveBloc.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget child;
  ResponsiveWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      context.read<ResponsiveBloc>().updateScreenResolution(updatedConstraints: constraints);
      return child;
    });
  }
}
