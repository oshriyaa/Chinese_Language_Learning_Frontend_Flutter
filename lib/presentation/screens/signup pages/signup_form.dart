import 'dart:ffi';

import 'package:chinese_learning/presentation/screens/signup%20pages/signup_textfield.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _signUpKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Form(
        child: Column(
      children: [
        const SignUpTextfield(
          hintText: "Enter your full name.",
          labelText: "Full Name",
         
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        const SignUpTextfield(
          hintText: "Enter your phone number.",
          labelText: "Phone Number",
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        const SignUpTextfield(
          hintText: "Enter your email.",
          labelText: "Email Address",
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        const SignUpTextfield(
          hintText: "Enter your password.",
          labelText: "Password",
        ),
      ],
    ));
  }
}
