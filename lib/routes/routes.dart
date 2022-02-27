import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
import 'package:chinese_learning/presentation/screens/login%20pages/login_screen.dart';
import 'package:chinese_learning/routes/route_constant.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginPage:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case HomeRoute:
        return MaterialPageRoute(builder: (_) => LandingScreen());
      case SignUpPage:
        return MaterialPageRoute(builder: (_) => LandingScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('404 Page Not Found!'),
                  ),
                ));
    }
  }
}
