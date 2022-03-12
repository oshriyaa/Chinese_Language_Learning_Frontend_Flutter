import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:flutter/material.dart';

class ChineseAlphabetPage extends StatelessWidget {
  const ChineseAlphabetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.L_RED,
      child: const Text("Chinese Alphabets"),
    );
  }
}
