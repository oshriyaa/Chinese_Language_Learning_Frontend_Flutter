import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:flutter/material.dart';

import '../../../../models/question_model.dart';
import '../../../colors/colors.dart';
import '../landing_screen.dart';

class EasyQuizPage extends StatefulWidget {
  const EasyQuizPage({Key? key}) : super(key: key);

  @override
  State<EasyQuizPage> createState() => _EasyQuizPageState();
}

class _EasyQuizPageState extends State<EasyQuizPage> {
  var score = 0;
  var n = 0;
  List questionList = [
    Questions("1.MS Word is a hardware.", false),
    Questions("2.CPU controls only input data of computer.", false),
    Questions("3.CPU stands for Central Processing Unit.", true),
    Questions(
        "4.Freeware is software that is available for use at no monetary cost..",
        true),
    Questions("5.MS Word is a hardware.", false),
    Questions("6.CPU controls only input data of computer.", false),
    Questions("7.CPU stands for Central Processing Unit.", true),
    Questions(
        "8.Freeware is software that is available for use at no monetary cost..",
        true),
  ];

  void checkAnswer(bool choice, BuildContext ctx) {
    if (choice == questionList[n].ans) {
      //debugPrint("Correct");
      score = score + 1;
      final snackbar = SnackBar(
        content: Text("Correct Answer"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
      );
      // Scaffold.of(ctx).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
        content: Text("Wrong Answer"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
      );
      // Scaffold.of(ctx).showSnackBar(snackbar);
    }
    setState(
      () {
        // if(n<que_list.length-1)
        if (n < 3) {
          n = n + 1;
        } else {
          final snackbar = SnackBar(
            content: Text("Quiz Completed Score $score/4"),
            duration: Duration(seconds: 5),
            backgroundColor: Colors.blueAccent,
          );
          Scaffold.of(ctx).showSnackBar(snackbar);
          reset();
        }
      },
    );
  }

  void reset() {
    setState(() {
      n = 0;
      score = 0;
    });
  }

  @override
  void initState() {
    questionList.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.WHITE),
        backgroundColor: CustomColors.RED,
        title: const Text("Test: Easy", style: StyleText.textAppBar),
        // automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LandingScreen(),
                ),
              );
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: Builder(
        builder: (ctx) => Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Question no. ${n + 1}", style: StyleText.Hedding30Text),
                  Container(
                    // color: Colors.yellow,
                    margin: const EdgeInsets.only(top: 10, bottom: 40),
                    height: 170,
                    width: size.width * 0.8,
                    // color: Colors.black,
                    child: Center(
                      child: Text(
                        questionList[n].que,
                        style: StyleText.questionFont,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: size.width * 0.35,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: CustomColors.GREEN,
                              padding: const EdgeInsets.all(10.0),
                              primary: Colors.black,
                              textStyle: const TextStyle(fontSize: 15),
                            ),
                            onPressed: () => checkAnswer(true, ctx),
                            child: const Text(
                              "True",
                              style: TextStyle(
                                  color: CustomColors.WHITE,
                                  fontFamily: 'Bitter',
                                  fontWeight: FontWeight.w200,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.35,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: CustomColors.RED,
                              padding: const EdgeInsets.all(10.0),
                              primary: Colors.black,
                              textStyle: const TextStyle(fontSize: 15),
                            ),
                            onPressed: () => checkAnswer(false, ctx),
                            child: const Text(
                              "False",
                              style: TextStyle(
                                  color: CustomColors.WHITE,
                                  fontFamily: 'Bitter',
                                  fontWeight: FontWeight.w200,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
