import 'package:chinese_learning/data/easy_quiz_question.dart';
import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:flutter/material.dart';
import '../../../colors/colors.dart';
import '../../../widgets/buttons/custom_test_answer_buttons.dart';
import '../landing_screen.dart';
import 'test_result.dart';

class EasyQuizPage extends StatefulWidget {
  const EasyQuizPage({Key? key}) : super(key: key);

  @override
  State<EasyQuizPage> createState() => _EasyQuizPageState();
}

class _EasyQuizPageState extends State<EasyQuizPage> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;
  bool selected = false;

  void _questionAnswered(bool answerScore) {
    setState(() {
      // answer was selected
      answerWasSelected = true;
      // check if answer was correct
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }
      _scoreTracker.add(
        answerScore
            ? Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : Icon(
                Icons.clear,
                color: Colors.red,
              ),
      );

      //when the quiz ends
      if (_questionIndex + 1 == 10) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
  }

  @override
  void initState() {
    easyQuestionList.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    child: Text("Question no. ${_questionIndex + 1}",
                        style: StyleText.Hedding30Text),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    height: 200,
                    width: size.width * 0.8,
                    // color: Colors.black,
                    child: Center(
                      child: Text(
                        easyQuestionList[_questionIndex]['question'] as String,
                        style: StyleText.questionFont,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ...(easyQuestionList[_questionIndex]['answers']
                          as List<Map<String, Object>>)
                      .map(
                    (answer) => CustomTestAnswerButtonWidget(
                      buttonText: answer['answerText'] as String,
                      buttonColor: answerWasSelected
                          ? answer['score'] as bool
                              ? CustomColors.GREEN
                              : CustomColors.RED
                          : CustomColors.WHITE,
                      btnTextStyle: answerWasSelected
                          ? StyleText.testWhiteAnswerButtons
                          : StyleText.testAnswerButtons,
                      shadowColor: CustomColors.BLACK,
                      buttonPress: () {
                        // if answer was already selected then nothing happens onTap
                        if (answerWasSelected) {
                          return;
                        }
                        //answer is being selected

                        _questionAnswered(answer['score'] as bool);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: size.width * 0.4,
                    margin: EdgeInsets.only(left: 150),
                    decoration: BoxDecoration(
                        color: CustomColors.RED,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          )
                        ]),
                    child: TextButton(
                      onPressed: () {
                        if (!answerWasSelected) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Please select an answer before going to the next question'),
                          ));
                          return;
                        }
                        endOfQuiz
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TestResults(
                                    testScore: _totalScore,
                                    level: 'easy',
                                  ),
                                ))
                            : _nextQuestion();
                      },
                      child: Text(endOfQuiz ? 'View Results' : 'Next Question →',
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'Bitter',
                            color: CustomColors.WHITE,
                          )),
                    ),
                  ),
                  
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150, left: 5),
              child: Column(
              
                      children: [
                        if (_scoreTracker.isEmpty)
                          const SizedBox(
                            height: 25.0,
                          ),
                        if (_scoreTracker.isNotEmpty) ..._scoreTracker
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
