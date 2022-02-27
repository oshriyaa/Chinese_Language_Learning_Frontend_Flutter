import 'dart:ui';

import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class SignUpTextfield extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;

  const SignUpTextfield({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.06,
      child: TextFormField(
        // controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          labelText: this.labelText,
          hintText: this.hintText,
          filled: true,
          fillColor: AppColor.L_RED,
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.BLUE,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
    );
  }
}
