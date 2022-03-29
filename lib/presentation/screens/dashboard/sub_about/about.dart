import 'package:chinese_learning/presentation/screens/dashboard/sub_about/description.dart';
import 'package:flutter/material.dart';

import '../../../colors/colors.dart';
import '../../../styling/textstyle.dart';
import 'history.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.WHITE),
        backgroundColor: CustomColors.RED,
        title: const Text("About", style: StyleText.textAppBar),
        // automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HistoryPage(),
                ),
              );
            },
            icon: const Icon(Icons.book),
          ),
        ],
      ),
      body: const AboutDescription(),
    );
  }
}
