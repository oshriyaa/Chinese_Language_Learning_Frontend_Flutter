import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:flutter/material.dart';

class WordDisplayScreen extends StatefulWidget {
  const WordDisplayScreen({Key? key}) : super(key: key);

  @override
  State<WordDisplayScreen> createState() => _WordDisplayScreenState();
}

class _WordDisplayScreenState extends State<WordDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 200,
                width: size.width * 0.9,
                child: Column(
                  children: const [
                    Text("Hello"),
                    Divider(),
                    Text("नमस्कार"),
                    Divider(),
                    Text("你好"),
                    Text("Nǐ hǎo"),
                    Text("नि हाओ")
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: CustomColors.WHITE,
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
        ],
      )),
    );
  }
}
