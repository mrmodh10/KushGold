import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kushgold_web/wrapper/responsive/bloc/responsiveBlocState.dart';

class ResponsiveBloc extends Cubit<ResponsiveBlocState> {
  BoxConstraints constraints = BoxConstraints();
  bool isSmall = false;
  bool isMedium = false;
  bool isLarge = true;
  ResponsiveBloc() : super(ResponsiveBlocInit());

  void updateScreenResolution({required BoxConstraints updatedConstraints}) {
    constraints = updatedConstraints;
    isLarge = false;
    isMedium = false;
    isSmall = false;
    if (constraints.maxWidth >= 1024) {
      isLarge = true;
    } else if (constraints.maxWidth >= 500) {
      isMedium = true;
    } else {
      isSmall = true;
    }

    emit(ResponsiveBlocUpdated(updatedConstraints));
  }

}
