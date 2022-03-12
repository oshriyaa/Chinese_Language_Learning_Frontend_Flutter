import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:flutter/material.dart';

import '../colors/colors.dart';

class CustomTestAnswerButtonWidget extends StatefulWidget {
  final String? buttonText;
  final Function()? onPress;
  CustomTestAnswerButtonWidget({Key? key, this.buttonText, this.onPress})
      : super(key: key);

  @override
  State<CustomTestAnswerButtonWidget> createState() =>
      _CustomTestAnswerButtonWidgetState();
}

class _CustomTestAnswerButtonWidgetState
    extends State<CustomTestAnswerButtonWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: size.width * 0.8,
      child: TextButton(
        child: Text(
          widget.buttonText!,
          style: StyleText.testAnswerButtons,
        ),
        onPressed: widget.onPress,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: CustomColors.WHITE,
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              offset: Offset(2, 2),
            )
          ]),
    );
  }
}
