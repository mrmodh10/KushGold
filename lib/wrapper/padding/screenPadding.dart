import 'package:flutter/material.dart';

class customPadding extends StatelessWidget {
  final Widget child;
  const customPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15, left: 15),
      child: child,
    );
  }
}
