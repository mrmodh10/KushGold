import 'package:flutter/material.dart';
import 'package:kushgold_web/router/router.dart';
import 'package:kushgold_web/theme/theme.dart';
import 'package:kushgold_web/theme/util.dart';
import 'package:kushgold_web/wrapper/initializeCubit/InitializeCubit.dart';
import 'package:kushgold_web/wrapper/responsive/responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");
    MaterialTheme theme = MaterialTheme(textTheme);
    return InitializeCubit(
      child: ResponsiveWidget(
        child: MaterialApp.router(
          routerConfig: goRouter,
          title: 'Kush Gold',
          theme: theme.light()
          // brightness == Brightness.light ? theme.light() : theme.dark(),
        ),
      ),
    );
  }
}
