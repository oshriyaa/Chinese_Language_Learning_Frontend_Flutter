import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/sub_test/test_page.dart';
import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_test_answer_buttons.dart';

class TestResults extends StatelessWidget {
  final int? testScore;
  const TestResults({Key? key, this.testScore}) : super(key: key);

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

                width: size.width * 0.8,
                // color: Colors.black,
                child: Center(
                  child: Text(
                    "$testScore",
                    style: const TextStyle(
                      fontSize: 100,
                      fontFamily: 'Bitter',
                      color: CustomColors.RED,
                      // fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Text(
                "out of 10",
                style: StyleText.Hedding30Text,
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Text(
                  testScore! > 4
                      ? 'Congratulations!'
                      : 'Better luck next time!',
                  style: const TextStyle(
                    fontSize: 30,
                    fontFamily: 'Bitter',
                    color: CustomColors.RED,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomTestAnswerButtonWidget(
                buttonText: "Save test results",
                btnTextStyle: StyleText.testAnswerButtons,
                buttonColor: CustomColors.WHITE,
                buttonPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestPage(),
                      ));
                },
              ),
              CustomTestAnswerButtonWidget(
                buttonText: "Take a new test",
                btnTextStyle: StyleText.testAnswerButtons,
                buttonColor: CustomColors.WHITE,
                buttonPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestPage(),
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
