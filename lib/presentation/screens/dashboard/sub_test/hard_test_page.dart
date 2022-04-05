import 'package:chinese_learning/data/text_question_data.dart';
import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/sub_test/test_result.dart';
import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:chinese_learning/presentation/widgets/custom_test_answer_buttons.dart';
import 'package:flutter/material.dart';

class HardQuestionPage extends StatefulWidget {
  const HardQuestionPage({Key? key}) : super(key: key);

  @override
  State<HardQuestionPage> createState() => _HardQuestionPageState();
}

class _HardQuestionPageState extends State<HardQuestionPage> {
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;

  void _questionAnswered(bool answerScore) {
    setState(() {
      // answer was selected
      answerWasSelected = true;
      // check if answer was correct
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }

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
    textQuizQuestion.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      body: SafeArea(
        child: Center(
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
                    textQuizQuestion[_questionIndex]['question'] as String,
                    style: StyleText.questionFont,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ...(textQuizQuestion[_questionIndex]['answers']
                      as List<Map<String, Object>>)
                  .map(
                (answer) => CustomTestAnswerButtonWidget(
                  buttonText: answer['answerText'] as String,
                  shadowColor: CustomColors.BLACK,
                  buttonColor: answerWasSelected
                      ? answer['score'] as bool
                          ? CustomColors.GREEN
                          : CustomColors.RED
                      : CustomColors.WHITE,
                  btnTextStyle: answerWasSelected
                      ? StyleText.testWhiteAnswerButtons
                      : StyleText.testAnswerButtons,
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
                              ),
                            ))
                        : _nextQuestion();
                  },
                  child: Text(endOfQuiz ? 'View Results' : 'Next Question →',
                      style: const TextStyle(
                        fontSize: 17,
                        fontFamily: 'Bitter',
                        color: CustomColors.WHITE,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
