import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class CustomSelectButton extends StatelessWidget {
  final String? buttonName;
  final String? buttonDesc;

  final Function()? onPress;
  const CustomSelectButton({Key? key, this.buttonName, this.buttonDesc, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 340,
        height: 110,
        child: TextButton(
          child: Column(
            children: [
              Text(
                buttonName!,
                style: const TextStyle(
                    color: CustomColors.WHITE,
                    fontFamily: 'Bitter',
                    fontWeight: FontWeight.w200,
                    fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    buttonDesc!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: CustomColors.WHITE,
                        fontFamily: 'Bitter',
                        fontWeight: FontWeight.w200,
                        
                        fontSize: 17),
                  ),
                ),
              ),
            ],
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
