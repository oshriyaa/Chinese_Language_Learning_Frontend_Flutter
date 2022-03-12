import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../styling/textstyle.dart';

class ClientInformationPage extends StatelessWidget {
  const ClientInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      appBar: AppBar(
          iconTheme: const IconThemeData(color: CustomColors.WHITE),
          backgroundColor: CustomColors.RED,
          title: const Text("Han Dao Institute", style: StyleText.textAppBar),
          // automaticallyImplyLeading: false,
          
        ),
    );
  }
}