import 'package:chinese_learning/presentation/screens/dashboard/sub_test/questions.dart';
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
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSelectButton(
                buttonName: "Take a test",
                onPress: (){ Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const QuestionPage(),
                    ));
              },
              ),
              CustomSelectButton(
                buttonName: "View test results",
                onPress: (){ Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const UserResults(),
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
