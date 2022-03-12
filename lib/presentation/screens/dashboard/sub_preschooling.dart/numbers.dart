import 'package:flutter/material.dart';

import '../../../colors/colors.dart';

class NumbersPage extends StatelessWidget {
  const NumbersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.L_RED,
      child: const Text("Number"),
    );
  }
}