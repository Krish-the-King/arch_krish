import 'package:arch_krish/features/Splash Screen/splashscreen.dart';
import 'package:go_router/go_router.dart';
import '../features/homepage/homescreen.dart';
//import '../features/lastpage/last_screen.dart';
//import '../features/listPage/presentation/UI/list_screen.dart';
import '../features/login screen/loginscreen.dart';
import '../features/resultpage/resultpage.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: "/login",
      name: "login",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/home",
      name: 'home',
      builder: (context, state) => const homescreen(),

    //   routes: [
    //     GoRoute(
    //       path: "listScreen",
    //       name: 'list',
    //       builder: (context, state) => const ListScreen(),
    //       routes: [
    //         GoRoute(
    //             path: 'lastScreen',
    //             name: "last",
    //             builder: (context, state) {
    //               return const LastScreen();
    //             }),
    //       ],
    //     ),
    //   ],
    ),
    GoRoute(
      path: "/result",
      name: "result",
      builder: (context, state) => const result(),
    ),
  ],
);