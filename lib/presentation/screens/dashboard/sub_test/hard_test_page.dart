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
      if (_questionIndex + 1 == _questions.length) {
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
    // what happens at the end of the quiz
    // if (_questionIndex >= _questions.length) {
    //   // _resetQuiz();
    // }
  }

  // void _resetQuiz() {
  //   setState(() {
  //     _questionIndex = 0;
  //     _totalScore = 0;
  //     endOfQuiz = false;
  //   });
  // }

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
                    _questions[_questionIndex]['question'] as String,
                    style: StyleText.questionFont,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ...(_questions[_questionIndex]['answers']
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
                margin: EdgeInsets.only(left: 100),
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
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Please select an answer before going to the next question'),
                      ));
                      return;
                    }
                    endOfQuiz
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  TestResults(testScore: _totalScore,),
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

const _questions = [
  {
    'question': 'How long is New Zealand’s Ninety Mile Beach?',
    'answers': [
      {'answerText': '88km, so 55 miles long.', 'score': true},
      {'answerText': '55km, so 34 miles long.', 'score': false},
      {'answerText': '90km, so 56 miles long.', 'score': false},
    ],
  },
  {
    'question':
        'In which month does the German festival of Oktoberfest mostly take place?',
    'answers': [
      {'answerText': 'January', 'score': false},
      {'answerText': 'October', 'score': false},
      {'answerText': 'September', 'score': true},
    ],
  },
  {
    'question': 'Who composed the music for Sonic the Hedgehog 3?',
    'answers': [
      {'answerText': 'Britney Spears', 'score': false},
      {'answerText': 'Timbaland', 'score': false},
      {'answerText': 'Michael Jackson', 'score': true},
    ],
  },
  {
    'question': 'In Georgia (the state), it’s illegal to eat what with a fork?',
    'answers': [
      {'answerText': 'Hamburgers', 'score': false},
      {'answerText': 'Fried chicken', 'score': true},
      {'answerText': 'Pizza', 'score': false},
    ],
  },
  {
    'question':
        'Which part of his body did musician Gene Simmons from Kiss insure for one million dollars?',
    'answers': [
      {'answerText': 'His tongue', 'score': true},
      {'answerText': 'His leg', 'score': false},
      {'answerText': 'His butt', 'score': false},
    ],
  },
  {
    'question': 'In which country are Panama hats made?',
    'answers': [
      {'answerText': 'Ecuador', 'score': true},
      {'answerText': 'Panama (duh)', 'score': false},
      {'answerText': 'Portugal', 'score': false},
    ],
  },
  {
    'question': 'From which country do French fries originate?',
    'answers': [
      {'answerText': 'Belgium', 'score': true},
      {'answerText': 'France (duh)', 'score': false},
      {'answerText': 'Switzerland', 'score': false},
    ],
  },
  {
    'question': 'Which sea creature has three hearts?',
    'answers': [
      {'answerText': 'Great White Sharks', 'score': false},
      {'answerText': 'Killer Whales', 'score': false},
      {'answerText': 'The Octopus', 'score': true},
    ],
  },
  {
    'question': 'Which European country eats the most chocolate per capita?',
    'answers': [
      {'answerText': 'Belgium', 'score': false},
      {'answerText': 'The Netherlands', 'score': false},
      {'answerText': 'Switzerland', 'score': true},
    ],
  },
];
