import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/signup%20pages/signup_form.dart';
import 'package:chinese_learning/presentation/screens/signup%20pages/signup_textfield.dart';
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
    return Scaffold(
      backgroundColor: AppColor.WHITE,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: AppColor.RED,
              fontSize: 40,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.03,),
        SignUpForm(),
      ]),
    );
  }
}
