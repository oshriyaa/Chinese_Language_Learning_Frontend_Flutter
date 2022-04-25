import 'dart:ffi';

import 'package:chinese_learning/network/api_service.dart';
import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
import 'package:chinese_learning/presentation/screens/dashboard/translate_dropdown_widget.dart';
import 'package:chinese_learning/presentation/widgets/buttons/custom_button.dart';
import 'package:chinese_learning/presentation/widgets/textfields/custom_white_textfield.dart';
import 'package:chinese_learning/presentation/widgets/validators.dart';
import 'package:flutter/material.dart';

import '../../../models/translation_model.dart';
import '../../colors/colors.dart';
import '../../styling/textstyle.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class TranslationPage extends StatefulWidget {
  const TranslationPage({Key? key}) : super(key: key);

  @override
  State<TranslationPage> createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  // double _confidence = 1.0;
  final _translateFormKey = GlobalKey<FormState>();
  final _translateController = TextEditingController();
  String? translatedText;
  late final _displayController = TextEditingController()
    ..text = translatedText!;
  String? query;
  String? target;
  String? source;

  String firstDropDown = 'English';
  String secondDropdown = 'Chinese';
  bool ispressed = false;

  final formKey = new GlobalKey<FormState>();

  Future<TranslationModel?>? gett;
  @override
  void initState() {
    _speech = stt.SpeechToText();
    gett = TranslationAPI.getTranslation();
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
          title: const Text("Translate", style: StyleText.textAppBar),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LandingScreen(),
                    ));
              },
              icon: const Icon(Icons.search),
            ),
          ]),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Form(
            key: _translateFormKey,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Translate",
                    style: StyleText.featureHeading,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 50, bottom: 7),
                            child: Text(
                              "From: ",
                              style: StyleText.questionFont,
                            ),
                          ),
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: CustomColors.WHITE,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 2,
                                    offset: Offset(2, 2),
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                              ),
                              child: DropdownButton<String>(
                                value: firstDropDown,
                                icon: const Icon(
                                  Icons.arrow_downward,
                                  color: CustomColors.RED,
                                ),
                                elevation: 10,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    firstDropDown = newValue!.toString();
                                  });
                                  print(firstDropDown);
                                },
                                items: <String>[
                                  'English',
                                  'Nepali',
                                  'Chinese'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,
                                        style: StyleText.categoryHeading),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding:
                                const EdgeInsets.only(right: 90, bottom: 7),
                            child: Text(
                              "To: ",
                              style: StyleText.questionFont,
                            ),
                          ),
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: CustomColors.WHITE,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 2,
                                    offset: Offset(2, 2),
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                              ),
                              child: DropdownButton<String>(
                                value: secondDropdown,
                                icon: const Icon(
                                  Icons.arrow_downward,
                                  color: CustomColors.RED,
                                ),
                                elevation: 10,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    secondDropdown = newValue!.toString();
                                  });
                                  print(secondDropdown);
                                },
                                items: <String>[
                                  'Chinese',
                                  'English',
                                  'Nepali'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,
                                        style: StyleText.categoryHeading),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    CustomWhiteTextField(
                      editable: false,
                      fieldHint: 'Enter text to be translated.',
                      controller: _translateController,
                      maxLine: 8,
                      leftPosition: 285,
                      topPosition: 170,
                      validation: (value) {
                        return TextValidator.emptyValidation(value);
                      },
                      save: (value) {
                        query = value;
                      },
                    ),
                    Positioned(
                        top: 20,
                        left: 300,
                        child: IconButton(
                          icon: Icon(Icons.mic),
                          iconSize: 30,
                          onPressed: () {
                            _readAudio();
                          },
                          color: CustomColors.RED,
                        ))
                  ],
                ),
                CustomFormButton(
                  buttonText: 'Translate',
                  save: () {
                    if (ispressed == true) {
                      if (_translateFormKey.currentState!.validate()) {
                        _translateFormKey.currentState!.save();

                        print(firstDropDown);
                        print(secondDropdown);

                        firstDropDown == 'English'
                            ? source = 'en'
                            : firstDropDown == 'Nepali'
                                ? source = 'ne'
                                : source = 'zh';

                        secondDropdown == 'Chinese'
                            ? target = 'zh'
                            : secondDropdown == 'Nepali'
                                ? target = 'ne'
                                : target = 'en';

                        gett = TranslationAPI.getTranslation(
                                text: query, target: target, source: source)
                            .whenComplete(() {
                          setState(() {
                            ispressed = false;
                          });
                        });
                      }
                    }
                    setState(() {
                      ispressed = true;
                    });
                  },
                ),
                FutureBuilder<TranslationModel?>(
                    future: gett,
                    builder: (BuildContext context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container(
                            height: 250,
                            decoration: BoxDecoration(
                              border: Border.all(color: CustomColors.GREY),
                              borderRadius: BorderRadius.circular(5),
                              color: CustomColors.WHITE,
                            ),
                            width: size.width * 0.85,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              child: const Text(
                                "Translated text will be displayed here.",
                                style: TextStyle(
                                    fontFamily: 'Bitter',
                                    color: CustomColors.GREY,
                                    fontSize: 20),
                              ),
                            ));
                      }
                      if (snapshot.hasData) {
                        translatedText = snapshot
                            .data?.data?.translations![0].translatedText;
                        print("HERE IS $translatedText");
                        return Container(
                          height: 250,
                          width: size.width * 0.85,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: Text(
                              translatedText!,
                              style: StyleText.featureHeading,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: CustomColors.GREY),
                            borderRadius: BorderRadius.circular(5),
                            color: CustomColors.WHITE,
                          ),
                        );
                      }
                      return Container(
                        height: 250,
                        width: size.width * 0.85,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: const Text(
                            "We are sorry to inform that an error has occored. Please, try again later.",
                            style: StyleText.categoryHeading,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: CustomColors.GREY),
                          borderRadius: BorderRadius.circular(5),
                          color: CustomColors.WHITE,
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _readAudio() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
          onStatus: (val) => print('onStatus: $val'),
          onError: (val) => print('onError: $val'));
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _translateController.text = val.recognizedWords;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
