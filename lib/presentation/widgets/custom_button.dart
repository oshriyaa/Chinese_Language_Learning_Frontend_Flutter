import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:flutter/material.dart';

class CustomFormButton extends StatelessWidget {
  final String? buttonText;
  final Function()? save;
  const CustomFormButton({
    Key? key,
    this.save,
    this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width * 0.4,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: CustomColors.RED,
            padding: const EdgeInsets.all(10.0),
            primary: Colors.black,
            textStyle: const TextStyle(fontSize: 15),
          ),
          child: Text(
            buttonText!,
            style: const TextStyle(
                color: CustomColors.WHITE,
                fontFamily: 'Bitter',
                fontWeight: FontWeight.w200,
                fontSize: 20),
          ),
          onPressed: save,
        ),
      ),
    );
  }
}
