import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/login%20pages/login_screen.dart';
import 'package:chinese_learning/presentation/screens/signup%20pages/signup_form.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.WHITE,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Center(child: SignUpForm()),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Already registered? Login.",
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
