import 'package:chinese_learning/models/vocabulary_model.dart';
import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/test.dart';
import 'package:flutter/material.dart';

import '../../../../network/api_service.dart';

class WordDisplayScreen extends StatefulWidget {
  const WordDisplayScreen({Key? key}) : super(key: key);

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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: DictionaryService().getMeaning(),
              builder:
                  (context, AsyncSnapshot<List<VocabularyModel>> snapshot) {
                print('Data $snapshot');
                if (snapshot.hasData) {
                  return Text("Data");
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
            //   FutureBuilder<List<VocabularyModel>> Futu(
            //       future: APIService().getVocabulary(),
            //       builder: (context, AsyncSnapshot<VocabularyModel?> snapshot) {
            //         if (snapshot.hasData) {
            //           return Column(
            //             children: [
            //               Text(snapshot.data!.inEnglish!),
            //               Text(snapshot.data!.inNepali!),
            //               Text(snapshot.data!.inChinese!),
            //               Text(snapshot.data!.inEnglish!),
            //             ],
            //           );
            //         } else if (snapshot.hasError) {
            //           print(snapshot.error);
            //           return SafeArea(child: Text('${snapshot.error}'));
            //         }
            //         return const CircularProgressIndicator();
            //       }),
          ],
        ),
      ),
    );
  }
}
