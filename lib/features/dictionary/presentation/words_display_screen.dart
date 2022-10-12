import 'package:chinese_learning/features/dictionary/domain/dictionary_provider.dart';
import 'package:chinese_learning/features/dictionary/presentation/word_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../network/api_service.dart';
import '../../../presentation/colors/colors.dart';
import '../../../presentation/screens/other/favourites_screen.dart';
import '../../../presentation/screens/other/search_screen.dart';
import '../../../presentation/styling/textstyle.dart';

class WordDisplayScreen extends StatefulWidget {
  final String? categoryID;
  const WordDisplayScreen({Key? key, this.categoryID}) : super(key: key);

  @override
  State<WordDisplayScreen> createState() => _WordDisplayScreenState();
}

class _WordDisplayScreenState extends State<WordDisplayScreen> {
  
  @override
  void initState() {
    callProvider();
    super.initState();
  }

  callProvider() async {
    await Provider.of<DictionaryProvider>(context, listen: false)
        .fetchVocabulary();
  }

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
      body: Consumer<DictionaryProvider>(
          builder: ((context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
                itemCount: provider.vocabulary!.length,
                itemBuilder: (context, index) {
                  final data = provider.vocabulary![index];
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
                }),
          ),
        );
      })),
    );
  }
}