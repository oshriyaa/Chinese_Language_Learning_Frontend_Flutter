import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
import 'package:chinese_learning/presentation/widgets/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

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
    var size = MediaQuery.of(context).size;
    return Form(
        key: _loginKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              onChanged: (value) {
                emailText = value;
              },
              validator: (value) {
                return TextValidator.emailValidation(value);
              },
              
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email address.",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                filled: true,
                fillColor: AppColor.L_RED,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: AppColor.GREY),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: AppColor.GREY),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: AppColor.GREY),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            TextFormField(
              controller: _passwordController,
              validator: (value) {
                return TextValidator.passwordValidation(value);
              },
              onSaved: (value) {
                passwordText = value;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: _obscureText,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password.",
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
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                filled: true,
                fillColor: AppColor.L_RED,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: AppColor.GREY),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: AppColor.GREY),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: AppColor.GREY),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: size.width * 0.4,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: AppColor.RED,
                  padding: const EdgeInsets.all(10.0),
                  primary: Colors.black,
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  if (_loginKey.currentState!.validate()) {
                    print('Validated');
                    _loginKey.currentState!.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LandingScreen(),
                      ),
                    );

                    print('should login');
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }
}
