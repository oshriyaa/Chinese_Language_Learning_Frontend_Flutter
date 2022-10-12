import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:flutter/material.dart';
import '../../../presentation/screens/dashboard/landing_screen.dart';
import 'table_row_data.dart';

class ChineseAlphabetPage extends StatelessWidget {
  const ChineseAlphabetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.L_RED,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: CustomColors.WHITE),
          backgroundColor: CustomColors.RED,
          title: const Text("Chinese Alphabets", style: StyleText.textAppBar),
          // automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LandingScreen()),
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
                  'Initals',
                  style: StyleText.featureHeading,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Pronounce the following with your teeth joint.',
                  style: StyleText.featureSubHeading,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '(यी दन्त्य व्यञ्जनलाई दात छोएर उच्चारण गरिन)',
                  style: StyleText.featureSubHeading,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: CustomColors.WHITE,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    children: const [
                      TableRow(children: [
                        TableRowData(rowData: 'b'),
                        TableRowData(rowData: 'p'),
                        TableRowData(rowData: 'f'),
                        TableRowData(rowData: 'm'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'पि'),
                        TableRowData(rowData: 'फी'),
                        TableRowData(rowData: 'फी (मोटो)'),
                        TableRowData(rowData: 'म')
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'प'),
                        TableRowData(rowData: 'फ'),
                        TableRowData(rowData: 'फ (मोटो)'),
                        TableRowData(rowData: 'म')
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'd'),
                        TableRowData(rowData: 't'),
                        TableRowData(rowData: 'n'),
                        TableRowData(rowData: 'l')
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'त'),
                        TableRowData(rowData: 'थ'),
                        TableRowData(rowData: 'न'),
                        TableRowData(rowData: 'ल')
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Pronounce the following with your throat.',
                  style: StyleText.featureSubHeading,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '(यी व्यञ्जनलाई घाटीबाट उच्चारण गरिन्छ)',
                  style: StyleText.featureSubHeading,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: CustomColors.WHITE,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    children: const [
                      TableRow(children: [
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'g',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'k',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'h',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                      ]),
                      TableRow(children: [
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'क',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'ख',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'ह',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                      ])
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Pronounce the following by adding 'a' sound.",
                  style: StyleText.featureSubHeading,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "(यी एकार व्यञ्जनलाई 'ए' मिसाएर उच्चारण गरिन्छ)",
                  style: StyleText.featureSubHeading,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: CustomColors.WHITE,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    children: const [
                      TableRow(children: [
                        TableRowData(rowData: 'j'),
                        TableRowData(rowData: 'q'),
                        TableRowData(rowData: 'x'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'चि'),
                        TableRowData(rowData: 'छि'),
                        TableRowData(rowData: 'सि'),
                      ])
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Pronounce the following with your teeth joint.',
                  style: StyleText.featureSubHeading,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "(यिनलाई आधा गरी, दात जोडेर उच्चारण गरिनछ )",
                  style: StyleText.featureSubHeading,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: CustomColors.WHITE,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    children: const [
                      TableRow(children: [
                        TableRowData(rowData: 'z'),
                        TableRowData(rowData: 'c'),
                        TableRowData(rowData: 's'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'च्'),
                        TableRowData(rowData: 'छ्'),
                        TableRowData(rowData: 'स्'),
                      ])
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Pronounce the following by adding 'h' sound.",
                  style: StyleText.featureSubHeading,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "(यी संयुक्त व्यञ्जनलाई पछाडी 'ह' जोडेर उच्चारण गरिन्छ )",
                  style: StyleText.featureSubHeading,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: CustomColors.WHITE,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    children: const [
                      TableRow(children: [
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'zh',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'ch',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'sh',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                      ]),
                      TableRow(children: [
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'च:',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'छ:',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'श:',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                      ])
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Pronounce the following as roman characters",
                  style: StyleText.featureSubHeading,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "(यिन लाई ओम रोमन वा देव्नागरिसरह उच्चारण गरिन्छ )",
                  style: StyleText.featureSubHeading,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    // color: CustomColors.L_RED,
                    color: CustomColors.WHITE,
                    // borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    children: const [
                      TableRow(children: [
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'r',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'w',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'y',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                      ]),
                      TableRow(children: [
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'र',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'वु',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'यि',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                      ])
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Finals',
                  style: StyleText.featureHeading,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                    // color: CustomColors.L_RED,
                    color: CustomColors.WHITE,
                    // borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    children: const [
                      TableRow(children: [
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'a',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'e',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'i',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'o',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'u',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                      ]),
                      TableRow(children: [
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'आ',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'अ',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'इ',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'ओ',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'उ',
                            style: StyleText.categoryHeading,
                          ),
                        )),
                      ])
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
