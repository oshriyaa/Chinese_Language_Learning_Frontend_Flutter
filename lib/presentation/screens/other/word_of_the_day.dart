import 'dart:math';
import 'package:chinese_learning/features/dictionary/presentation/word_widget.dart';
import 'package:flutter/material.dart';
import '../../../features/dictionary/data/datasource/vocabulary_service.dart';
import '../../../features/favourites/data/datasource/favourites_service.dart';
import '../../colors/colors.dart';
import '../../styling/textstyle.dart';
import '../dashboard/landing_screen.dart';
import '../../../features/authentication/presentation/login pages/login_form.dart';

class WordOfTheDay extends StatefulWidget {
  const WordOfTheDay({Key? key}) : super(key: key);

  @override
  State<WordOfTheDay> createState() => WordOfTheDayState();
}

class WordOfTheDayState extends State<WordOfTheDay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.WHITE),
        backgroundColor: CustomColors.RED,
        title: const Text("Word of the day", style: StyleText.textAppBar),
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
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Center(
                child: Text(
              "Word of the Day",
              style: StyleText.categoryHeading,
            )),
            FutureBuilder(
              future: DictionaryService().getMeaning(),
              builder:
                  (context, AsyncSnapshot<dynamic> snapshot) {
                // print('Data $snapshot');
                var list = ['1', '2', '3', '4', '5'];

                // generates a new Random object
                final _random = new Random();

                // generate a random index based on the list length
                // and use it to retrie ve the element
                var element = list[_random.nextInt(list.length)];
                int newelement = generatedElement;

                if (snapshot.hasData) {
                  int index = snapshot.data!.length - 1;

                  for (var i = 0; i < index; i++) {
                    print(i);

                    final data = snapshot.data![i];
                    int id = data.wordId!;

                    if (id == newelement) {
                      return WordWidget(
                        inEng: data.inEnglish!,
                        inNep: data.inNepali!,
                        inChi: data.inChinese!,
                        inPin: data.inPinYin!,
                        inDev: data.inDevnagari!,
                        audio: data.audio,
                        favPressed: () {
                          FavouritesAPI.addFavourites(word: (data.wordId));
                        },
                      );
                    } else {
                      const SizedBox(
                        height: 1,
                      );
                    }
                    ;
                  }
                  return const SizedBox(
                    height: 1,
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
    );
  }
}
