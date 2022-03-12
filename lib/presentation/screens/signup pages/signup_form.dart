import 'package:chinese_learning/presentation/screens/login%20pages/login_screen.dart';
import 'package:chinese_learning/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/validators.dart';
import '../dashboard/landing_screen.dart';

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

  String? fullNameInput;
  String? numberImput;
  String? passwordInput;
  String? emailInput;
  bool _obscureText = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // ignore: sized_box_for_whitespace
    return Form(
        key: _signUpKey,
        child: Column(
          children: [
            const Text(
              "Sign Up",
              style: TextStyle(
                color: CustomColors.RED,
                fontFamily: 'Bitter',
                fontSize: 40,
              ),
            ),
            CustomTextField(
              fieldHint: "Enter your full name.",
              fieldLabel: "Full name",
              controller: _fullNameController,
              save: (value) {
                fullNameInput = value;
              },
              obscure: false,
              validation: (value) {
                return TextValidator.fullNameValidation(value);
              },
            ),
            CustomTextField(
              fieldHint: "Enter your Phone number.",
              fieldLabel: "Phone number",
              controller: _phoneNumberController,
              save: (value) {
                numberImput = value;
              },
              obscure: false,
              validation: (value) {
                return TextValidator.phoneNumberValidation(value);
              },
            ),
            CustomTextField(
              fieldHint: "Enter your Email.",
              fieldLabel: "Email",
              controller: _emailController,
              save: (value) {
                emailInput = value;
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
                  _obscureText == true
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  print('The eye visibility is working.');
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              obscure: _obscureText,
              save: (value) {
                passwordInput = value;
              },
              validation: (value) {
                return TextValidator.passwordValidation(value);
              },
            ),
            CustomFormButton(
              buttonText: "Sign Up",
              save: () {
                if (_signUpKey.currentState!.validate()) {
                  print('Validated');
                  _signUpKey.currentState!.save();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                }
              },
            ),
          ],
        ));
  }
}
