import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class ResultWidget extends StatelessWidget {
  final Color? iconColor;
  final String? level;
  final String? date;
  final String? time;
  final int? score;

  const ResultWidget({
    Key? key,
    this.iconColor,
    this.date,
    this.time,
    this.level,
    this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: CustomColors.WHITE,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(blurRadius: 4, offset: Offset(0, 0)),
            ],
          ),
          width: size.width * 0.8,
          height: size.height * 0.14,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Icon(Icons.military_tech, color: iconColor, size: 80),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Level: $level", style: StyleText.questionFont),
                    Text("Date: $date", style: StyleText.aboutDesc),
                    Text("Time: $time", style: StyleText.aboutDesc),
                    Text("Score: ${score}", style: StyleText.categoryHeading),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
