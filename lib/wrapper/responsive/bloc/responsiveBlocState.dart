import 'package:flutter/material.dart';

abstract class ResponsiveBlocState{}

class ResponsiveBlocInit extends ResponsiveBlocState{}
class ResponsiveBlocUpdated extends ResponsiveBlocState{
  final BoxConstraints constraints;
  ResponsiveBlocUpdated(this.constraints);
}