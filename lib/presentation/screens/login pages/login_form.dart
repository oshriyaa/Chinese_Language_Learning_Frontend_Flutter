import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
import 'package:chinese_learning/presentation/widgets/custom_button.dart';

import 'package:chinese_learning/presentation/widgets/validators.dart';

import 'package:flutter/material.dart';

import '../../widgets/custom_textfield.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? passwordText;
  String? emailText;
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Form(
      key: _loginKey,
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Text(
            "Login",
            style: TextStyle(
              color: CustomColors.RED,
              fontFamily: 'Bitter',
              fontSize: 40,
            ),
          ),
          CustomTextField(
            fieldHint: "Enter your Email.",
            fieldLabel: "Email",
            controller: _emailController,
            save: (value) {
              emailText = value;
            },
            obscure: false,
            validation: (value) {
              return TextValidator.emailValidation(value);
            },
          ),
          CustomTextField(
            fieldHint: "Enter your password.",
            fieldLabel: "Password",
            controller: _passwordController,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText == true ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                // print('The eye visibility is working.');
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            obscure: _obscureText,
            save: (value) {
              passwordText = value;
            },
            validation: (value) {
              return TextValidator.passwordValidation(value);
            },
          ),
          CustomFormButton(
            buttonText: "Login",
            save: () {
              if (_loginKey.currentState!.validate()) {
                // print('Validated');
                _loginKey.currentState!.save();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LandingScreen(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
