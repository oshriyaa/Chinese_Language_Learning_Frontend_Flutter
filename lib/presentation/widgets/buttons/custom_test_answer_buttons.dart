import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class CustomTestAnswerButtonWidget extends StatefulWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color shadowColor;
  final TextStyle? btnTextStyle;
  final Function()? buttonPress;
  const CustomTestAnswerButtonWidget(
      {Key? key,
      this.buttonText,
      this.buttonColor,
      required this.shadowColor,
      this.btnTextStyle,
      this.buttonPress})
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
        child: Text(widget.buttonText!, style: widget.btnTextStyle),
        onPressed: widget.buttonPress,
      ),
      decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: widget.shadowColor, blurRadius: 4, offset: Offset(2, 2))
          ]),
    );
  }
}
