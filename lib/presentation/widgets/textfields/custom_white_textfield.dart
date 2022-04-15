import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class CustomWhiteTextField extends StatelessWidget {
  final String? fieldHint;
  final String? fieldLabel;
  final TextEditingController? controller;
  final Function(String?)? save;
  final String? Function(String?)? validation;
  final int? maxLine;
  final double? topPosition;
  final double? leftPosition;
  final  bool? editable;
  const CustomWhiteTextField({
    Key? key,
    this.fieldHint,
    this.save,
    this.controller,
    this.fieldLabel,
    this.validation,
    this.maxLine,
    this.leftPosition,
    this.topPosition,
    this.editable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            width: size.width * 0.85,
            // height: size.height * 0.06,
            child: TextFormField(
              readOnly: editable!,
              controller: controller,
              maxLines: maxLine,
              onSaved: save,
              validator: validation,
              style: StyleText.categoryHeading,
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
                labelStyle: const TextStyle(
                    fontFamily: 'Bitter',
                    color: CustomColors.RED,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: fieldHint,
                hintStyle: const TextStyle(fontFamily: 'Bitter', color: CustomColors.GREY, fontSize: 20),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                filled: true,
                fillColor: CustomColors.WHITE,
              ),
            ),
          ),
          editable==false?
           Positioned(
              top: topPosition,
              left: leftPosition,
              child: TextButton(
                child: Text(
                  'Clear',
                  style: StyleText.featureSubHeading,
                ),
                onPressed: () {
                  controller?.clear();
                },
              ))  
              : SizedBox(),
        ],
      ),
    );
  }
}
