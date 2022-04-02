import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../../../../data/hard_quiz_question.dart';
import '../../../colors/colors.dart';
import '../../../styling/textstyle.dart';
import '../../../widgets/custom_test_answer_buttons.dart';
import 'test_result.dart';

class HardTestQuizPage extends StatefulWidget {
  HardTestQuizPage({Key? key}) : super(key: key);

  @override
  State<HardTestQuizPage> createState() => _HardTestQuizPageState();
}

class _HardTestQuizPageState extends State<HardTestQuizPage> {
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;

  late AudioPlayer player;
  @override
  void initState() {
    hardQuizQuestionData.shuffle();
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

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
      if (_questionIndex + 1 == hardQuizQuestionData.length) {
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
                  child: hardQuizQuestionData[_questionIndex]['category'] ==
                          'audio'
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              hardQuizQuestionData[_questionIndex]['question']
                                  as String,
                              style: StyleText.questionFont,
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                  color: CustomColors.RED,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 2,
                                      offset: Offset(2, 2),
                                    )
                                  ]),
                              child: TextButton.icon(
                                label: const Text(
                                  "Play ",
                                  style: StyleText.testWhiteAnswerButtons,
                                ),
                                icon: const Icon(
                                  Icons.play_arrow,
                                  color: CustomColors.WHITE,
                                ),
                                onPressed: () async {
                                  await player.setAsset('assets/audio/cow.mp3');
                                  player.play();
                                },
                              ),
                            )
                          ],
                        )
                      : Text(
                          hardQuizQuestionData[_questionIndex]['question']
                              as String,
                          style: StyleText.questionFont,
                          textAlign: TextAlign.center,
                        ),
                ),
              ),
              ...(hardQuizQuestionData[_questionIndex]['answers']
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