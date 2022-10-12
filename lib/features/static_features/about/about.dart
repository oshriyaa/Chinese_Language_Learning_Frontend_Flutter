import 'package:chinese_learning/features/static_features/about/description.dart';
import 'package:flutter/material.dart';
import '../../../presentation/colors/colors.dart';
import '../../../presentation/styling/textstyle.dart';
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
