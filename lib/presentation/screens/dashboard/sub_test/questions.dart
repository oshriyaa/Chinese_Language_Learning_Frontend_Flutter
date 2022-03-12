import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/sub_test/test_result.dart';
import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:chinese_learning/presentation/widgets/custom_test_answer_buttons.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
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
                  "Question no. 1",
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
                height: 200,
                width: size.width * 0.8,
                // color: Colors.black,
                child: const Center(
                  child: Text(
                    "This is the question.This is the question.This is the question.This is the question.",
                    style: StyleText.questionFont,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              CustomTestAnswerButtonWidget(
                buttonText: "Answers",
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestResults(),
                      ));
                },
              ),
              CustomTestAnswerButtonWidget(
                buttonText: "Answers",
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestResults(),
                      ));
                },
              ),
              CustomTestAnswerButtonWidget(
                buttonText: "Answers",
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestResults(),
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
