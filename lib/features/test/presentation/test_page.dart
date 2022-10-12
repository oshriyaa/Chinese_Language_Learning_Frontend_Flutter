import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
import 'package:chinese_learning/presentation/widgets/buttons/custom_select_button.dart';
import 'package:flutter/material.dart';

import '../../../../presentation/colors/colors.dart';
import '../../../../presentation/styling/textstyle.dart';
import '../../../../presentation/widgets/custom_drawer.dart';
import 'easy_test.dart';
import 'hard_test_page.dart';
import 'normal_test_page.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.WHITE),
        backgroundColor: CustomColors.RED,
        title: const Text("Test", style: StyleText.textAppBar),
        // automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LandingScreen()),
                  (Route<dynamic> route) => false);
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSelectButton(
                buttonName: "Level: Easy",
                buttonDesc:
                    "Test your languange knowledge with True/False tests.",
                onPress: () {
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => WillPopScope(
                              onWillPop: () async => false,
                              child: EasyQuizPage(),
                            )),
                  );
                },
              ),
              CustomSelectButton(
                buttonName: "Level: Medium",
                buttonDesc:
                    "Test your languange knowledge with MCQ language questions.",
                onPress: () {
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => WillPopScope(
                              onWillPop: () async => false,
                              child: NormalQuestionPage(),
                            )),
                  );
                },
              ),
              CustomSelectButton(
                buttonName: "Level: Difficult",
                buttonDesc:
                    "Test your languange knowledge with MCQ and audio based questions.",
                onPress: () {
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => WillPopScope(
                              onWillPop: () async => false,
                              child: HardTestQuizPage(),
                            )),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
