import 'package:chinese_learning/presentation/screens/dashboard/feedback/feedback_form.dart';
import 'package:chinese_learning/presentation/widgets/textfields/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../../../colors/colors.dart';
import '../../../styling/textstyle.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.WHITE),
        backgroundColor: CustomColors.RED,
        title: const Text("Feedback", style: StyleText.textAppBar),
        // automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                width: size.width * 0.8,
                child: const Text(
                  "Send us your feedback and help us improve.",
                  style: StyleText.questionFont,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: size.width * 0.9,
                height: size.height * 0.3,
                child: Image.asset('lib/assets/feedbackwithoutbackground.png'),
              ),
              Container(
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: CustomColors.WHITE,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 2,
                        offset: Offset(2, 2),
                      )
                    ]),
              ),
              SizedBox(height: 30,),
             FeedbackForm(),
            ],
          ),
        ),
      ),
    );
  }
}
