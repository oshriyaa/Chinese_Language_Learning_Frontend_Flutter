import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:flutter/material.dart';

import '../../../colors/colors.dart';

class WordWidget extends StatelessWidget {
  final String? inEng;
  final String? inNep;
  final String? inChi;
  final String? inPin;
  final String? inDev;
  const WordWidget({
    Key? key,
    this.inEng,
    this.inNep,
    this.inChi,
    this.inPin,
    this.inDev,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Center(
        child: Container(
          width: size.width * 0.9,
          child: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Word:',
                    style: StyleText.categoryHeading,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'English:',
                    style: StyleText.featureSubHeading,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    inEng!,
                    style: StyleText.vocabularyText,
                  ),
                  // const Divider(
                  //   thickness: 1,
                  //   color: CustomColors.GREY,
                  //   endIndent: 70,
                  // ),
                  
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Nepali:',
                    style: StyleText.featureSubHeading,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    inNep!,
                    style: StyleText.vocabularyText,
                  ),
                  const Divider(
                    thickness: 1,
                    color: CustomColors.GREY,
                    endIndent: 70,
                  ),
                  const Text(
                    'Translation:',
                    style: StyleText.categoryHeading,
                  ),
                   const SizedBox(
                    height: 10,
                  ),
                  Text(
                    inChi!,
                    style: StyleText.vocabularyText,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    inPin!,
                    style: StyleText.vocabularyText,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    inDev!,
                    style: StyleText.vocabularyText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Positioned(
                top: 240,
                  left: size.width * 0.6,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_arrow,
                        color: CustomColors.RED,
                        size: 45,
                      )))
            ]),
          ),
          decoration: BoxDecoration(
            color: CustomColors.WHITE,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                blurRadius: 2,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
