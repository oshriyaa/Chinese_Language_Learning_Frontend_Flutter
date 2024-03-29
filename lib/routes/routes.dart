import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
import 'package:chinese_learning/features/authentication/presentation/login%20pages/login_screen.dart';
import 'package:chinese_learning/routes/route_constant.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginPage:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case HomeRoute:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      case SignUpPage:
        return MaterialPageRoute(builder: (_) => const LandingScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: const Center(
                    child: const Text('404 Page Not Found!'),
                  ),
                ));
    }
  }
}
