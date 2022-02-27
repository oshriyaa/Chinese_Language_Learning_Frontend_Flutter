import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.WHITE,
      appBar: AppBar(
        backgroundColor: AppColor.RED,
        title: Text(
          "Namastey China",
          style: TextStyle(color: Colors.white ),
        ),
      ),
    );
  }
}
