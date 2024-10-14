import 'package:flutter/material.dart';
import 'package:kushgold_web/router/router.dart';
import 'package:kushgold_web/theme/theme.dart';
import 'package:kushgold_web/theme/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'Kush Gold',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
    );
  }
}
