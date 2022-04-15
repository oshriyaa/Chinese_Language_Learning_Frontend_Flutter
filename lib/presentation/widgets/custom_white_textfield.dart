import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/colors.dart';

class CustomWhiteTextField extends StatelessWidget {
  final String? fieldHint;
  final String? fieldLabel;
  final TextEditingController? controller;
  final Function(String?)? save;
  final String? Function(String?)? validation;
  final Widget? suffixIcon;
  final int? maxLine;
  const CustomWhiteTextField({
    Key? key,
    this.fieldHint,
    this.save,
    this.controller,
    this.fieldLabel,
    this.validation,
    this.suffixIcon,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: size.width * 0.85,
        // height: size.height * 0.06,
        child: TextFormField(
          controller: controller,
          maxLines: maxLine,
          onSaved: save,
          validator: validation,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: CustomColors.RED,
              ),
            ),
            labelText: fieldLabel,
            labelStyle:
                const TextStyle(fontFamily: 'Bitter', color: CustomColors.RED, fontSize: 20, fontWeight: FontWeight.bold),
            floatingLabelBehavior:FloatingLabelBehavior.always,    
            hintText: fieldHint,
            hintStyle: const TextStyle(fontFamily: 'Bitter'),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            filled: true,
            fillColor: CustomColors.WHITE,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
