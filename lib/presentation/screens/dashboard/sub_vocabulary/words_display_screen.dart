import 'package:chinese_learning/models/vocabulary_model.dart';
import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/sub_vocabulary/word_widget.dart';
import 'package:flutter/material.dart';

import '../../../../network/api_service.dart';
import '../../../styling/textstyle.dart';
import '../../other/favourites_screen.dart';
import '../../other/search_screen.dart';

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
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.WHITE),
        backgroundColor: CustomColors.RED,
        title: const Text("Word", style: StyleText.textAppBar),
        // automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavouritesScreen(),
                  ));
            },
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
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
                          print("DATA $data.categoryID");
                          return data.categoryId == widget.categoryID
                              ? WordWidget(
                                  inEng: data.inEnglish!,
                                  inNep: data.inNepali!,
                                  inChi: data.inChinese!,
                                  inPin: data.inPinYin!,
                                  inDev: data.inDevnagari!,
                                  audio: data.audio,
                                  favPressed: () {
                                    FavouritesAPI.addFavourites(
                                        word: (data.wordId));
                                    final snackBar = SnackBar(
                                      content: const Text(
                                        'Favourites list has been updated.',
                                        style: StyleText.testWhiteAnswerButtons,
                                      ),
                                      backgroundColor: (CustomColors.RED),
                                      action: SnackBarAction(
                                        label: 'View.',
                                        textColor: CustomColors.WHITE,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const FavouritesScreen(),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                )
                              : const SizedBox(
                                  height: 0,
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
