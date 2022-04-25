import 'package:chinese_learning/network/api_service.dart';
import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
import 'package:chinese_learning/presentation/screens/dashboard/sub_test/test_page.dart';
import 'package:chinese_learning/presentation/screens/other/profile_screen.dart';
import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:chinese_learning/presentation/widgets/logout_alert.dart';
import 'package:flutter/material.dart';
import '../../../widgets/buttons/custom_test_answer_buttons.dart';
import '../../../widgets/dialog.dart';

class TestResults extends StatefulWidget {
  final int? testScore;
  final String? level;

  const TestResults({Key? key, this.testScore, this.level}) : super(key: key);

  @override
  State<TestResults> createState() => _TestResultsState();
}

class _TestResultsState extends State<TestResults> {
  bool? disable = false;
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
                margin: const EdgeInsets.only(top: 140),
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
                margin: const EdgeInsets.only(top: 20),

                width: size.width * 0.8,
                // color: Colors.black,
                child: Center(
                  child: Text(
                    "${widget.testScore}",
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
                  widget.testScore! > 4
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
              SizedBox(
                height: 20,
              ),
              CustomTestAnswerButtonWidget(
                buttonText: "Save test results",
                btnTextStyle: StyleText.testAnswerButtons,
                buttonColor: CustomColors.WHITE,
                buttonPress: disable == false
                    ? () {
                        final snackBar = SnackBar(
                          content: const Text(
                            'Your progress has been saved.',
                            style: StyleText.testWhiteAnswerButtons,
                          ),
                          backgroundColor: (CustomColors.RED),
                          action: SnackBarAction(
                            label: 'View.',
                            textColor: CustomColors.WHITE,
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const ProfileScreen()),
                                  (Route<dynamic> route) => false);
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        ResultsApi.saveResults(
                            result: widget.testScore, level: widget.level);

                        setState(() {
                          disable = true;
                        });
                      }
                    : null,
                shadowColor: CustomColors.BLACK,
              ),
              CustomTestAnswerButtonWidget(
                buttonText: "Take a new test",
                btnTextStyle: StyleText.testAnswerButtons,
                buttonColor: CustomColors.WHITE,
                buttonPress: () {
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const TestPage(),
                    ),
                  );
                },
                shadowColor: CustomColors.BLACK,
              ),
              CustomTestAnswerButtonWidget(
                buttonText: "Return to home",
                btnTextStyle: StyleText.testAnswerButtons,
                buttonColor: CustomColors.WHITE,
                buttonPress: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LandingScreen()),
                      (Route<dynamic> route) => false);
                },
                shadowColor: CustomColors.BLACK,
              ),
            ],
          ),
        ),
      ),
    );
  }


}
