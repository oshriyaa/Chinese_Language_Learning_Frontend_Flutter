import 'dart:math';
import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
import 'package:chinese_learning/presentation/widgets/buttons/custom_button.dart';
import 'package:chinese_learning/presentation/widgets/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../../static_features/preschooling/chinese_alphabets.dart';
import '../../data/datasource/auth_service.dart';
import '../../../../presentation/widgets/textfields/custom_textfield.dart';

int generatedElement = 0;

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
  late FlutterLocalNotificationsPlugin fltrNotification;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    var androidInitilize = new AndroidInitializationSettings('app_icon');
    //  var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings =
        //  new InitializationSettings(androidInitilize, iOSinitilize);
        new InitializationSettings(android: androidInitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: (_) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChineseAlphabetPage(),
            )));
  }

  Future showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "Channel ID", "programmer",
        importance: Importance.high);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails);

    var scheduledTime = DateTime.now().add(Duration(minutes: 5));
    fltrNotification.schedule(
        1,
        "Word of the day",
        "Check out today's word of the day.",
        scheduledTime,
        generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginKey,
      child: Column(
        children: [
          const Text(
            "Login",
            style: TextStyle(
                color: CustomColors.RED, fontFamily: 'Bitter', fontSize: 40),
          ),
          CustomTextField(
            fieldHint: "Enter your username.",
            fieldLabel: "Username",
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
                  _obscureText == true
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                }),
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

      setState(() {
        pressedLogin = true;
      });

      loginResponse = await AuthService.login(emailText, passwordText);
      print('FIRST PRINT $loginResponse');

      // print('TOKEN = ${loginResponse['token']}');

      await Future.delayed(const Duration(seconds: 0));
      print("HERE IS RESPONSE $loginResponse");
      if (loginResponse == null) {
        print("HERE AGAIN");
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Your login credentitals are invalid. Please check and try again.'),
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
        showNotification();
        var list = ['1', '2', '3', '4', '5'];

        // generates a new Random object
        final _random = new Random();

        // generate a random index based on the list length
        // and use it to retrie ve the element
        var element = list[_random.nextInt(list.length)];
        generatedElement = int.parse(element);
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
