import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
import 'package:chinese_learning/features/authentication/presentation/login%20pages/login_screen.dart';
import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:chinese_learning/presentation/widgets/textfields/custom_textfield.dart';
import 'package:flutter/material.dart';
import '../../data/datasource/auth_service.dart';
import '../../../../network/api_service.dart';
import '../../../../presentation/colors/colors.dart';
import '../../../../presentation/widgets/buttons/custom_button.dart';
import '../../../../presentation/widgets/validators.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _signUpKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? fullNameInput;
  String? numberInput;
  String? passwordInput;
  String? confirmInputPassword;
  String? emailInput;
  bool _obscureText = true;
   bool _obscureTextAgain = true;
  bool? pressedRegister = false;
  var registerResponse;

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

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
                numberInput = value;
              },
              obscure: false,
              validation: (value) {
                return TextValidator.phoneNumberValidation(value);
              },
            ),
            CustomTextField(
              fieldHint: "Enter your username.",
              fieldLabel: "Username",
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
                  // print('The eye visibility is working.');
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
            CustomTextField(
              fieldHint: "Re-enter your password.",
              fieldLabel: "Confirm Password",
              controller: _confirmPasswordController,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText == true
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  // print('The eye visibility is working.');
                  setState(() {
                    _obscureTextAgain = !_obscureTextAgain;
                  });
                },
              ),
              obscure: _obscureText,
              save: (value) {
                confirmInputPassword = value;
              },
              validation: (value) {
                return TextValidator.passwordValidation(value);
              },
            ),
            CustomFormButton(
                buttonText: "Sign Up",
                save: () {
                  Register(context);
                }),
          ],
        ));
  }

  //Method for register
  Register(BuildContext context) async {
    if (_signUpKey.currentState!.validate()) {
      _signUpKey.currentState!.save();

      setState(() {
        pressedRegister = true;
      });

      if (passwordInput == confirmInputPassword) {
        registerResponse = await AuthService.register(
            fullNameInput, numberInput, emailInput, passwordInput);

        if (registerResponse == null) {
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: const Text(
                  'Your register credentitals are invalid. Please check and try again.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .pop(); // dismisses only the dialog and returns nothing
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text(
                'Registration Successful',
                style: StyleText.categoryHeading,
              ),
              content: const Text(
                'You have been registered successfully.',
                style: StyleText.featureSubHeading,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                LoginScreen())); // dismisses only the dialog and returns nothing
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } else {
        print("Not same");
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Your passwords do not match.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop(); // dismisses only the dialog and returns nothing
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
      loginError(context);
      pressedRegister = false;
    }
  }

  loginError(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("${registerResponse["status"].toUpperCase()}"),
      content: Text("${registerResponse["message"]}"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
