import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
import 'package:chinese_learning/presentation/screens/login%20pages/login_screen.dart';
import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:chinese_learning/routes/routes.dart';
import 'package:flutter/material.dart';
import 'secure_storage/secure_storage.dart';
import 'routes/route_constant.dart';

late final SecureStorage secureStorage;


//where application starts
void main() {
  // creating instance of secure storage
  secureStorage = SecureStorage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Title of application
      title: 'Namaste China',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      //Splash screen code 
       home: AnimatedSplashScreen(
        splash: Image.asset(
          'lib/assets/fyp_logo_white.png',
        ),
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 500,
        // pageTransitionType:  PageTransitionType.scale,
        backgroundColor: CustomColors.RED,
        // nextScreen: LandingScreen(),
        nextScreen: FutureBuilder(
          builder: (context, snapshot) {
            print('SNAPSHOT.DATA $snapshot.data');
            if (snapshot.data != null) {
              return LandingScreen();
            }
            return LoginScreen();
          },
          future: checkToken(),
        ),
      ),
    );
  }
}

Future checkToken() async {
  var token = await secureStorage.readSecureData('token');
  return token;
}

