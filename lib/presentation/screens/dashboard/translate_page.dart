import 'package:chinese_learning/network/api_service.dart';
import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
import 'package:chinese_learning/presentation/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../models/translation_model.dart';
import '../../colors/colors.dart';
import '../../styling/textstyle.dart';

class TranslatePage extends StatefulWidget {
  const TranslatePage({Key? key}) : super(key: key);

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  // Future<TranslationModel?>? getTranslation;
  final _translateFormKey = GlobalKey<FormState>();
  final _translateController = TextEditingController();

  String? translationInput;
  // @override
  // void initState() {
  //   print(translationInput);
  //   getTranslation = TranslationAPI.getTranslation(word: translationInput);
  //   super.initState();
  // }

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
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: size.width * 0.9,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Enter English Phrase",
                    style: StyleText.featureHeading,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _translateFormKey,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: CustomColors.WHITE,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  offset: Offset(0, 0),
                                )
                              ]),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            controller: _translateController,
                            maxLines: 11,
                            decoration: const InputDecoration(
                              hintText: "Enter texts to be translated",
                              // fillColor: CustomColors.WHITE,
                              filled: true,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomFormButton(
                          buttonText: "Translate",
                          save: () {
                            setState(
                              () {
                                
                                translationInput =
                                    _translateController.text.toString();
                                    print(translationInput);
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Translated Chinese Text",
                    style: StyleText.featureHeading,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: size.height * 0.3,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: CustomColors.WHITE,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            offset: Offset(0, 0),
                          )
                        ]),
                    child: FutureBuilder<TranslationModel?>(
                      future: TranslationAPI.getTranslation(word: translationInput),
                      builder: (BuildContext context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasData) {
                          print(snapshot.data?.result);
                          return Container(
                            child: Column(children: [
                              Text(snapshot.data?.lang as String),
                              Text(snapshot.data?.text as String),
                              Text(snapshot.data?.result as String),
                            ]),
                          );
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
