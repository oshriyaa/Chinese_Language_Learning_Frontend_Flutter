import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TranslateDropdown extends StatefulWidget {
  final String word1;
  final String word2;
  final String word3;

  const TranslateDropdown({Key? key, required this.word1, required this.word2, required this.word3}) : super(key: key);

  @override
  State<TranslateDropdown> createState() => _TranslateDropdownState();
}

class _TranslateDropdownState extends State<TranslateDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: CustomColors.WHITE,
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              offset: Offset(2, 2),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: DropdownButton<String>(
          value: widget.word1,
          icon: const Icon(Icons.arrow_downward, color: CustomColors.RED,),
          elevation: 10,
         
          onChanged: (String? newValue) {
            setState(() {
              newValue = widget.word1;
            });
          },
          items: <String>[widget.word1, widget.word2, widget.word3]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: StyleText.categoryHeading),
            );
          }).toList(),
        ),
      ),
    );
  }
}
