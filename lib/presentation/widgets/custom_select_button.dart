import 'package:flutter/material.dart';

import '../colors/colors.dart';

class CustomSelectButton extends StatelessWidget {
  final String? buttonName;
  final Function()? onPress;
  const CustomSelectButton({Key? key, this.buttonName,this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: 300,
        height: 100,
        child: TextButton(
          child: Text(
            buttonName!,
            style: const TextStyle(
                color: CustomColors.WHITE,
                fontFamily: 'Bitter',
                fontWeight: FontWeight.w200,
                fontSize: 25),
          ),
          onPressed: onPress,
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: CustomColors.RED,
            textStyle: const TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
