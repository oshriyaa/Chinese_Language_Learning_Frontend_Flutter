import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/sub_test/questions.dart';
import 'package:chinese_learning/presentation/screens/dashboard/sub_test/results.dart';
import 'package:flutter/material.dart';


import '../../../widgets/custom_test_answer_buttons.dart';

class TestResults extends StatelessWidget {
  const TestResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 150),
                child: const Text(
                  "You have scored:",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Bitter',
                    color: CustomColors.RED,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                height: 230,
                width: size.width * 0.8,
                // color: Colors.black,
                child: const Center(
                  child: Text(
                    "70%",
                    style: TextStyle(
    fontSize: 100,
    fontFamily: 'Bitter',
    color: CustomColors.RED,
    // fontWeight: FontWeight.bold,
  ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              CustomTestAnswerButtonWidget(
                buttonText: "Take a new test",
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuestionPage(),
                      ));
                },
              ),
              CustomTestAnswerButtonWidget(
                buttonText: "View your test report",
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserResults(),
                      ));
                },
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
