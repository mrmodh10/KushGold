import 'package:go_router/go_router.dart';
import 'package:kushgold_web/UI/homeScreen/homeScreen.dart';

GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(path:"/",
    builder: (context,state) => const HomeScreen()),
  ]
);