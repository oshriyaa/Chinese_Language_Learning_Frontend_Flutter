// import 'package:chinese_learning/models/vocabulary_model.dart';
// import 'package:chinese_learning/presentation/colors/colors.dart';
// import 'package:chinese_learning/presentation/screens/dashboard/sub_vocabulary/word_widget.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// import '../../../../network/api_service.dart';
// import '../../../../network/dio_api.dart';

// class WordDisplayScreen extends StatefulWidget {
//   final String? categoryID;
//   const WordDisplayScreen({Key? key, this.categoryID}) : super(key: key);

//   @override
//   State<WordDisplayScreen> createState() => _WordDisplayScreenState();
// }

// class _WordDisplayScreenState extends State<WordDisplayScreen> {

//   @override
//   Widget build(BuildContext context) {
//     // var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: CustomColors.L_RED,
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 5,
//               ),
//               FutureBuilder(
//               future: getHttp(),
//               builder: (context, snapshot) {
//                 switch (snapshot.connectionState) {
//                   case ConnectionState.none:
//                   case ConnectionState.waiting:
//                   case ConnectionState.active:
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   case ConnectionState.done:
//                     if (snapshot.hasError) {
//                       DioError error = snapshot.error;
//                       String message = error.message;
//                       if (error.type == DioErrorType.CONNECT_TIMEOUT)
//                         message = 'Connection Timeout';
//                       else if (error.type == DioErrorType.RECEIVE_TIMEOUT)
//                         message = 'Receive Timeout';
//                       else if (error.type == DioErrorType.RESPONSE)
//                         message =
//                             '404 server not found ${error.response.statusCode}';
//                       return Text('Error: ${message}');
//                     }
//                     List<String> people = new List<String>();
//                     Response response = snapshot.data;
//                     for (int i = 0; i < response.data['results'].length; i++) {
//                       people.add(response.data['results'][i]['name']);
//                     }
//                     return Expanded(
//                         child: ListView.builder(
//                       itemCount: people.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return ListTile(
//                           title: Text(people[index]),
//                         );
//                       },
//                     ));
//                 }
//               },
//             )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class C1 {}

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
                                  audio: data.audio,
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
