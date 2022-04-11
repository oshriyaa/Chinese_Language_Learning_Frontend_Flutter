import 'package:chinese_learning/routes/routes.dart';
import 'package:flutter/material.dart';
import 'models/secure_storage.dart';
import 'routes/route_constant.dart';

late final SecureStorage secureStorage;


void main() {
  secureStorage = SecureStorage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Namaste China',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      // initialRoute: SignUpPage,
      initialRoute: LoginPage,
    );
  }
}

Future checkToken() async {
  var token = await secureStorage.readSecureData('token');
  return token;
}
