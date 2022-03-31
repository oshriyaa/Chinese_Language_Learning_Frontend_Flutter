import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
import 'package:chinese_learning/presentation/screens/dashboard/sub_test/easy_test.dart';
import 'package:chinese_learning/presentation/screens/dashboard/sub_test/hard_test.dart';
import 'package:chinese_learning/presentation/screens/dashboard/sub_test/results.dart';
import 'package:chinese_learning/presentation/widgets/custom_select_button.dart';
import 'package:flutter/material.dart';

import '../../../colors/colors.dart';
import '../../../styling/textstyle.dart';
import '../../../widgets/custom_drawer.dart';

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
            onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LandingScreen(),
                  ),
                );},
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
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EasyQuizPage(),
                      ));
                },
              ),
              CustomSelectButton(
                buttonName: "Level: Hard",
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserResults(),
                      ));
                },
              ),
              CustomSelectButton(
                buttonName: "Audio Test",
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
