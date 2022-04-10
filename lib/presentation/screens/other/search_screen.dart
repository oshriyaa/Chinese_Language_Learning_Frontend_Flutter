import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
import 'package:chinese_learning/presentation/screens/other/search_delegate.dart';
import 'package:chinese_learning/presentation/screens/other/search_form.dart';
import 'package:flutter/material.dart';

import '../../../models/vocabulary_model.dart';
import '../../../network/api_service.dart';
import '../../colors/colors.dart';
import '../../styling/textstyle.dart';
import '../dashboard/sub_vocabulary/word_widget.dart';

class SearchScreen extends StatefulWidget {
  final String? input;

  const SearchScreen({Key? key, this.input}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
 DictionaryService _vocabularyList = DictionaryService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.RED,
          foregroundColor: CustomColors.WHITE,
          title: Text('Search', style: StyleText.testWhiteAnswerButtons,),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchUser());
              },
              icon: Icon(Icons.search_sharp),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: FutureBuilder<List<VocabularyModel>>(
              future: _vocabularyList.getMeaning(),
              builder: (context, snapshot) {
                var data = snapshot.data;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: CustomColors.RED,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${data?[index].wordId}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${data?[index].inEnglish}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '${data?[index].inNepali}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ])
                              ],
                            ),
                            // trailing: Text('More Info'),
                          ),
                        ),
                      );
                    });
              }),
        ),
      ),
    );
  }
}


// import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
// import 'package:chinese_learning/presentation/screens/other/search_delegate.dart';
// import 'package:chinese_learning/presentation/screens/other/search_form.dart';
// import 'package:flutter/material.dart';

// import '../../../models/vocabulary_model.dart';
// import '../../../network/api_service.dart';
// import '../../colors/colors.dart';
// import '../../styling/textstyle.dart';
// import '../dashboard/sub_vocabulary/word_widget.dart';

// class SearchScreen extends StatefulWidget {
//   final String? input;

//   const SearchScreen({Key? key, this.input}) : super(key: key);

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomColors.L_RED,
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: CustomColors.WHITE),
//         backgroundColor: CustomColors.RED,
//         title: const Text("Search", style: StyleText.textAppBar),
//         // automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.favorite),
//           ),
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const LandingScreen(),
//                   ));
//             },
//             icon: const Icon(Icons.home),
//           ),
//         ],
//       ),
//       body: SafeArea(
//           child: Column(
//         children: [
         
         
//         ],
//       )),
//     );
//   }
// }
