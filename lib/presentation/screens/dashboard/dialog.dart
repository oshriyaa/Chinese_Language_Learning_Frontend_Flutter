import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../widgets/custom_white_icon_button.dart';

class DialogAlert extends StatelessWidget {
  final String? btn1;
  final String? btn2;
  final String? btn3;
  final IconData? btn1icn;
  final IconData? btn2icn;
  final IconData? btn3icn;
  final String? imageLink;
  const DialogAlert({
    Key? key,
    this.btn1,
    this.btn2,
    this.btn3,
    this.btn1icn,
    this.btn2icn,
    this.btn3icn,
    this.imageLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(10),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: CustomColors.L_RED),
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Column(
                  children: [
                    CustomWhiteIconButton(
                      save: () {},
                      buttonText: btn1,
                      btnIcon: btn1icn,
                    ),
                    Divider(
                      thickness: 0.5,
                      color: CustomColors.GREY,
                    ),
                    CustomWhiteIconButton(
                      save: () {},
                      buttonText: btn2,
                      btnIcon: btn2icn,
                    ),
                    Divider(
                      thickness: 0.5,
                      color: CustomColors.GREY,
                    ),
                    CustomWhiteIconButton(
                      save: () {},
                      buttonText: btn3,
                      btnIcon: btn3icn,
                    )
                  ],
                )),
            Positioned(
                top: -50,
                child: Image.asset(imageLink!,
                    width: 90, height: 90))
          ],
        ));
  }
}
