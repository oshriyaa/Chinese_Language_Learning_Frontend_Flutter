// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class CustomTextField extends StatelessWidget {
  final String? fieldHint;
  final String? fieldLabel;
  final TextEditingController? controller;
  final bool obscure;
  final Function(String?)? save;
  final String? Function(String?)? validation;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    this.fieldHint,
    this.save,
    required this.obscure,
    this.controller,
    this.fieldLabel,
    this.validation,
    this.suffixIcon,
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
          onSaved: save,
          validator: validation,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            labelText: fieldLabel,
            labelStyle:
                const TextStyle(fontFamily: 'Bitter', color: CustomColors.RED),
            hintText: fieldHint,
            hintStyle: const TextStyle(fontFamily: 'Bitter'),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            filled: true,
            fillColor: CustomColors.L_RED,
            suffixIcon: suffixIcon,
          ),
          obscureText: obscure,
        ),
      ),
    );
  }
}
