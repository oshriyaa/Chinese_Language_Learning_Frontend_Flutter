import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
import 'package:flutter/material.dart';
import '../../../presentation/colors/colors.dart';
import '../../../presentation/styling/textstyle.dart';
import 'table_row_data.dart';

class TonesPage extends StatelessWidget {
  const TonesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.WHITE),
        backgroundColor: CustomColors.RED,
        title: const Text("Tones", style: StyleText.textAppBar),
        // automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LandingScreen()),
                  (Route<dynamic> route) => false);
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'There are four recognised tones in Mandarin with one mysterious tone which makes the tones five in total.',
                style: StyleText.featureSubHeading,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'First Tone (Flat Tone) - प्रथम',
                style: StyleText.categoryHeading,
              ),
              const SizedBox(
                height: 10,
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    const Text(
                      "The first tone is made when your voice becomes higher and flatter. The pitch is raised and the syllable is pronounced with a drawn-out tone that doesn’t drop or rise in between.",
                      style: StyleText.featureSubHeading,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "उच्च वा समानान्तर (→)",
                      style: StyleText.categoryHeading,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Table(
                      border: TableBorder.all(color: Colors.black),
                      children: const [
                        TableRow(children: [
                          SmallTableRowData(rowData: 'mā'),
                          SmallTableRowData(rowData: 'मा'),
                          SmallTableRowData(rowData: 'आमा'),
                        ]),
                        TableRow(children: [
                          SmallTableRowData(rowData: 'bā'),
                          SmallTableRowData(rowData: 'पा'),
                          SmallTableRowData(rowData: 'आठ'),
                        ]),
                      ],
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Second Tone (Rising Tone) - दोश्रो',
                style: StyleText.categoryHeading,
              ),
              const SizedBox(
                height: 10,
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    const Text(
                      "The second tone is made with a rising voice. The pitch starts out low and then becomes higher as if the voice is rising. ",
                      style: StyleText.featureSubHeading,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "आरोह वा मास्तिर (↗)",
                      style: StyleText.categoryHeading,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Table(
                      border: TableBorder.all(color: Colors.black),
                      children: const [
                        TableRow(children: [
                          SmallTableRowData(rowData: 'má'),
                          SmallTableRowData(rowData: 'मा'),
                          SmallTableRowData(rowData: 'के? उखेल्नु'),
                        ]),
                        TableRow(children: [
                          SmallTableRowData(rowData: 'bá'),
                          SmallTableRowData(rowData: 'पा'),
                          SmallTableRowData(rowData: 'तान्नु'),
                        ]),
                      ],
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Third Tone (Dip Tone) - तेस्रो',
                style: StyleText.categoryHeading,
              ),
              const SizedBox(
                height: 10,
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    const Text(
                      "The third tone is one of the hardest for Mandarin learners. The pitch falls lower before rising higher again. An easy way to practice this tone is to make your voice go low and then high while saying a single syllable or word.",
                      style: StyleText.featureSubHeading,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "आरोह- अवरोह वा तल र मास्तिर  (↘↗)",
                      style: StyleText.categoryHeading,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Table(
                      border: TableBorder.all(color: Colors.black),
                      children: const [
                        TableRow(children: [
                          SmallTableRowData(rowData: 'mǎ'),
                          SmallTableRowData(rowData: 'मा'),
                          SmallTableRowData(rowData: 'घोडा'),
                        ]),
                        TableRow(children: [
                          SmallTableRowData(rowData: 'bǎ'),
                          SmallTableRowData(rowData: 'पा'),
                          SmallTableRowData(rowData: 'निशाना'),
                        ]),
                      ],
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Fourth Tone (Falling Tone) - चौथो',
                style: StyleText.categoryHeading,
              ),
              const SizedBox(
                height: 10,
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    const Text(
                      "The fourth tone is pronounced as a falling tone. To pronounce it correctly, say the word with force, making your pitch fall.",
                      style: StyleText.featureSubHeading,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "अवरोह वा तलतिर (↘)",
                      style: StyleText.categoryHeading,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Table(
                      border: TableBorder.all(color: Colors.black),
                      children: const [
                        TableRow(children: [
                          SmallTableRowData(rowData: 'mà'),
                          SmallTableRowData(rowData: 'मा'),
                          SmallTableRowData(rowData: 'गाली गर्नु'),
                        ]),
                        TableRow(children: [
                          SmallTableRowData(rowData: 'bà'),
                          SmallTableRowData(rowData: 'पा'),
                          SmallTableRowData(rowData: 'बुबा'),
                        ]),
                      ],
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Fifth Tone (Neutral Tone) - पाचौ',
                style: StyleText.categoryHeading,
              ),
              const SizedBox(
                height: 10,
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: const [
                    Text(
                      "Whether the fifth tone is actually considered a tone is up for debate. Instead of making your voice or pitch go up and down, this tone is simply neutral—which means the word has no tone. Pinyin doesn’t mark the fifth tone simply because there’s nothing you have to change or emphasize.",
                      style: StyleText.featureSubHeading,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "तटस्थ वा कमजोर (X)",
                      style: StyleText.categoryHeading,
                      textAlign: TextAlign.justify,
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
