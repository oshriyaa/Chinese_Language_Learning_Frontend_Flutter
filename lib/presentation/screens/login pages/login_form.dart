import 'package:chinese_learning/network/api_service.dart';
import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
import 'package:chinese_learning/presentation/widgets/buttons/custom_button.dart';

import 'package:chinese_learning/presentation/widgets/validators.dart';

import 'package:flutter/material.dart';

import '../../widgets/textfields/custom_textfield.dart';

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
  bool? pressedLogin = false;
  var loginResponse;

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
              logIn(context);

            },
          ),
        ],
      ),
    );
  }

  logIn(BuildContext context) async {
    if (_loginKey.currentState!.validate()) {
      _loginKey.currentState!.save();
      pressedLogin = true;
      setState(() {});

      loginResponse = await AuthService.login(emailText, passwordText);
      print('FIRST PRINT $loginResponse');

      // print('TOKEN = ${loginResponse['token']}');

      await Future.delayed(const Duration(seconds: 0));
      print("HERE IS RESPONSE $loginResponse");
      if (loginResponse==null) {
        print("HERE AGAIN");
         await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:  const Text('Error'),
        content: const Text(
                'Your login credentitals are invalid. Please check and try again.'),
        actions: <Widget>[
           TextButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pop(); // dismisses only the dialog and returns nothing
            },
            child:  const Text('OK'),
          ),
        ],
      ),
    );
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => LandingScreen()));
      }
    } else {
      loginError(context);
      pressedLogin = false;
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
      title: Text("${loginResponse.toUpperCase()}"),
      content: Text("${loginResponse["message"]}"),
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
