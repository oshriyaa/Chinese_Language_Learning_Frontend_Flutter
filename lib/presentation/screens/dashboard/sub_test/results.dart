import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:flutter/material.dart';

class UserResults extends StatefulWidget {
  const UserResults({Key? key}) : super(key: key);

  @override
  State<UserResults> createState() => _UserResultsState();
}

class _UserResultsState extends State<UserResults> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: CustomColors.L_RED,
      body: Center(child: SafeArea(child: Column(
        children: [
         for (var i = 0; i < 10; i++) Text("ALL results display here"),
        ],
      ),),),
    );
  }
}
