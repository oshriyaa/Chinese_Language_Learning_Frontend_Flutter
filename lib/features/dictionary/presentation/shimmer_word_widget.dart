import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../presentation/colors/colors.dart';
import '../../../presentation/styling/textstyle.dart';

class ShimmerWord extends StatefulWidget {
  const ShimmerWord({
    Key? key,
  }) : super(key: key);

  @override
  State<ShimmerWord> createState() => _ShimmerWordState();
}

class _ShimmerWordState extends State<ShimmerWord> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Center(
        child: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.grey.shade300,
          child: Container(
            height: size.height * 0.5,
            width: size.width * 0.9,
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
      ),
    );
  }
}
