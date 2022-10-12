import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
import 'package:flutter/material.dart';
import '../../../presentation/styling/textstyle.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.WHITE),
        backgroundColor: CustomColors.RED,
        title: const Text("History", style: StyleText.textAppBar),
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
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 20),
              child: Center(
                child: Text(
                  "Chinese Language History",
                  style: StyleText.featureHeading,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: CustomColors.WHITE,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 6,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              width: size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: const [
                    Text(
                      "In historical linguistics, the history of the Chinese language includes the various changes over time of the Chinese language in its various incarnations. Earliest known origins of the Chinese language date back 6,000 years.[1] Modern day characters had not been introduced until centuries later, leaving many components of Chinese language quite obscure and unknown.",
                      style: StyleText.featureSubHeading,
                      textAlign: TextAlign.justify,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        "Sino-Tibetan ancestry",
                        style: StyleText.categoryHeading,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Text(
                      "Chinese is part of the Sino-Tibetan language family, a group of languages that all descend from Proto-Sino-Tibetan. While there is very good documentation that allows for the reconstruction of the ancient sounds of Chinese, there is no written documentation of the point where Chinese split from the rest of the Sino-Tibetan languages. Despite their affinity, the common ancestry of the Chinese and Tibeto-Burman languages remains an unproven hypothesis.",
                      style: StyleText.featureSubHeading,
                      textAlign: TextAlign.justify,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        "Old Chinese",
                        style: StyleText.categoryHeading,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Text(
                      "Old Chinese, sometimes known as 'Archaic Chinese', is genetically related to all current dialects of Chinese. The first known use of the Chinese writing system is divinatory inscriptions into tortoise shells and oracle bones in the Shang dynasty (1766–1122 BC). In the later early and middle Zhou dynasty (1122–256 BC), writing which descended from the Shang is found texts of which include inscriptions on bronze artifacts.",
                      style: StyleText.featureSubHeading,
                      textAlign: TextAlign.justify,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        "Middle Chinese",
                        style: StyleText.categoryHeading,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Text(
                      "Middle Chinese was the language used during the Sui dynasty, Tang dynasty,and Song dynasty, or the sixth to tenth centuries AD. It can be divided into an early period, which can be shown by the Qieyun rime dictionary (AD 601) and its later redaction the Guangyun.",
                      style: StyleText.featureSubHeading,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 20),
              child: Center(
                child: Text(
                  "Written Language",
                  style: StyleText.featureHeading,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: CustomColors.WHITE,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 6,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              width: size.width * 0.9,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "The Chinese language is the oldest written language in the world with at least six thousand years of history. Chinese character inscriptions have been found in turtle shells dating back to the Shang dynasty1 (1766-1123 BC) proving the written language has existed for more than 3,000 years. The Chinese written language uses single distinctive symbols, or characters, to represent each word of the vocabulary. Although the written system has been altered over time due to revolutions and political changes, the principles of the language along with the symbols and characters have remained basically the same.",
                  style: StyleText.featureSubHeading,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 20),
              child: Center(
                child: Text(
                  "The Chinese Linguistic Revolution",
                  style: StyleText.featureHeading,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: CustomColors.WHITE,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 6,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              width: size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: const [
                    Text(
                      "The 20th-century movement for language reform in China has resulted in the most ambitious programme of language planning the world has ever seen. The programme has three aims: ",
                      style: StyleText.featureSubHeading,
                      textAlign: TextAlign.justify,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "(i) to simplify the characters of classical written Chinese, by cutting down on their number, and reducing the number of strokes it takes to write a character",
                        style: StyleText.featureSubHeading,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "(ii) to provide a single means of spoken communication throughout the whole of China, by popularizing the Beijing-based variety, which has been chosen as a standard",
                        style: StyleText.featureSubHeading,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "(iii) to introduce a phonetic alphabet, which would gradually replace the Chinese characters in everyday use.",
                        style: StyleText.featureSubHeading,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Text(
                      "There have been moves to reform the language from as early as the 2nd century BC, but there has been nothing to equal the complexity of the present-day programme. in which frequent reference is made to the names of several different varieties of the Chinese language.",
                      style: StyleText.featureSubHeading,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
