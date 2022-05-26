import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../styling/textstyle.dart';

class FeatureContainer extends StatelessWidget {
  final String? tileTitle;
  final String? tileSubHeading;
  final String? image;
  final Function()? tapFunction;

  const FeatureContainer(
      {Key? key,
      this.tileTitle,
      this.tileSubHeading,
      this.image,
      this.tapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: Container(
          height: 140,
          width: size.width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: CustomColors.WHITE,
              boxShadow: const [
                BoxShadow(blurRadius: 2, offset: Offset(2, 2))
              ]),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(image!, width: 150, height: 150),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: ListTile(
                  onTap: tapFunction,
                  leading: const SizedBox(width: 120),
                  title: Text(
                    tileTitle!,
                    style: StyleText.featureHeading,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Text(tileSubHeading!,
                        style: StyleText.featureSubHeading),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 30.0),
                  dense: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
