import 'package:chinese_learning/models/favourites_model.dart';
import 'package:chinese_learning/network/api_service.dart';
import 'package:chinese_learning/routes/route_constant.dart';
import 'package:flutter/material.dart';

import '../../../models/vocabulary_model.dart';
import '../../colors/colors.dart';
import '../../styling/textstyle.dart';
import '../dashboard/landing_screen.dart';
import '../dashboard/sub_vocabulary/word_widget.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.WHITE),
        backgroundColor: CustomColors.RED,
        title: const Text("Favourites", style: StyleText.textAppBar),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LandingScreen(),
                ),
              );
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // TextButton(onPressed: (){FavouritesAPI.getFavourites();}, child: Text("Press")),
              const SizedBox(
                height: 5,
              ),
              FutureBuilder(
                future: FavouritesAPI().getFavourites(),
                builder:
                    (context, AsyncSnapshot<List<FavouritesModel>> snapshot2) {
                  // print('Data $snapshot2');
                  if (snapshot2.hasData) {
                    return Column(
                      children: List.generate(
                        snapshot2.data!.length,
                        (index) {
                          final data2 = snapshot2.data![index];
                          print("DATA $data2");
                          return FutureBuilder(
                            future: DictionaryService().getMeaning(),
                            builder: (context,
                                AsyncSnapshot<List<VocabularyModel>> snapshot) {
                              // print('Data $snapshot');
                              if (snapshot.hasData) {
                                return Column(
                                  children: List.generate(
                                    snapshot.data!.length,
                                    (index) {
                                      final data = snapshot.data![index];
                                      print("DATA $data");
                                      return data.wordId == data2.vocabulary
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

                                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => FavouritesScreen()),);
                                              },
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
                          );
                        },
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
