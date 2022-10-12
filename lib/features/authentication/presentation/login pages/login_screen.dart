import 'package:chinese_learning/features/authentication/presentation/login%20pages/login_form.dart';
import 'package:flutter/material.dart';
import '../../../../presentation/colors/colors.dart';
import '../signup pages/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.WHITE,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 250),
                child: Center(child: LoginForm()),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 30),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Not registered? Sign up.",
                      style: TextStyle(color: CustomColors.RED),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
