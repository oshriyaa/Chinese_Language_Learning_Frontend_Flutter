import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:chinese_learning/features/dictionary/domain/dictionary_provider.dart';
import 'package:chinese_learning/features/favourites/domain/favourites_provider.dart';
import 'package:chinese_learning/features/profile/domain/profile_provider.dart';
import 'package:chinese_learning/features/test/domain/result_provider.dart';
import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
import 'package:chinese_learning/features/authentication/presentation/login%20pages/login_screen.dart';
import 'package:chinese_learning/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'secure_storage/secure_storage.dart';
import 'package:native_notify/native_notify.dart';

late final SecureStorage secureStorage;

//where application starts
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NativeNotify.initialize(
      602,
      'uhBdUdbWSfLQeDMeDkeqvt',
      'AAAALLm7fS8:APA91bEHzgy465MIcnSTLA73Jd7-4rpONt2KC0Ghv3GcWDAUlkgUE7_7Wiw8q0_zyxO75geBpXW9-zZTp50Fwfr8tk13Wi7pEs_7NEa_dspfp8_Jbdzyl2YoieXI6e5g8jFfYS-ZNETu',
      null);
  // creating instance of secure storage
  secureStorage = SecureStorage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DictionaryProvider()),
        ChangeNotifierProvider(create: (_) => ResultProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),

      ],
      builder: (context, child) {
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
                if (snapshot.data != null) {
                  return LandingScreen();
                }
                return LoginScreen();
              },
              future: checkToken(),
            ),
          ),
        );
      },
    );
  }
}

Future checkToken() async {
  var token = await secureStorage.readSecureData('token');
  return token;
}
