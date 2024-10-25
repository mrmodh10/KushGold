import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kushgold_web/wrapper/responsive/bloc/responsiveBloc.dart';

class InitializeCubit extends StatelessWidget {
  final Widget child;
  const InitializeCubit({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ResponsiveBloc()),
      ],
      child: child,
    );
  }
}
