import 'package:flutter/material.dart';

import '../../../colors/colors.dart';

class TonesPage extends StatelessWidget {
  const TonesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.L_RED,
      child: const Text("Tones"),
    );
  }
}