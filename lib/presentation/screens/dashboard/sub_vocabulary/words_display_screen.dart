import 'package:chinese_learning/models/vocabulary_model.dart';
import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/sub_vocabulary/word_widget.dart';
import 'package:flutter/material.dart';

import '../../../../network/api_service.dart';

class WordDisplayScreen extends StatefulWidget {
  final String? categoryID;
  const WordDisplayScreen({Key? key, this.categoryID}) : super(key: key);

  @override
  State<WordDisplayScreen> createState() => _WordDisplayScreenState();
}

class _WordDisplayScreenState extends State<WordDisplayScreen> {
  // late Future<VocabularyModel?> futureVocabulary;

  // @override
  // void initState() {
  //   futureVocabulary = APIService.getVocabulary();

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              FutureBuilder(
                future: DictionaryService().getMeaning(),
                builder:
                    (context, AsyncSnapshot<List<VocabularyModel>> snapshot) {
                  // print('Data $snapshot');
                  if (snapshot.hasData) {
                    return Column(
                      children: List.generate(
                        snapshot.data!.length,
                        (index) {
                          final data = snapshot.data![index];
                          return data.categoryId == widget.categoryID
                              ? WordWidget(
                                  inEng: data.inEnglish!,
                                  inNep: data.inNepali!,
                                  inChi: data.inChinese!,
                                  inPin: data.inPinYin!,
                                  inDev: data.inDevnagari!,
                                )
                              : const SizedBox(
                                  height: 1,
                                );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class C1 {}
