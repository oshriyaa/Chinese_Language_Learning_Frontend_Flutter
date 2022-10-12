import 'package:chinese_learning/features/static_features/preschooling/table_row_data.dart';
import 'package:flutter/material.dart';
import '../../../presentation/colors/colors.dart';
import '../../../presentation/screens/dashboard/landing_screen.dart';
import '../../../presentation/styling/textstyle.dart';


class NepaliAlphabetPage extends StatelessWidget {
  const NepaliAlphabetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.L_RED,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: CustomColors.WHITE),
          backgroundColor: CustomColors.RED,
          title: const Text("Nepali Alphabets", style: StyleText.textAppBar),
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
                  'Consonants',
                  style: StyleText.featureHeading,
                ),
                const SizedBox(
                  height: 10,
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
                        TableRowData(rowData: 'Nepali'),
                        TableRowData(rowData: 'Roman'),
                        TableRowData(rowData: 'Nepali'),
                        TableRowData(rowData: 'Roman'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'क'),
                        TableRowData(rowData: 'g'),
                        TableRowData(rowData: 'ध'),
                        TableRowData(rowData: '-'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'ख'),
                        TableRowData(rowData: 'k'),
                        TableRowData(rowData: 'न'),
                        TableRowData(rowData: 'n'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'ग'),
                        TableRowData(rowData: 'g'),
                        TableRowData(rowData: 'प'),
                        TableRowData(rowData: 'b'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'घ'),
                        TableRowData(rowData: '-'),
                        TableRowData(rowData: 'फ'),
                        TableRowData(rowData: 'p/f'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'ङ'),
                        TableRowData(rowData: 'ng'),
                        TableRowData(rowData: 'ब'),
                        TableRowData(rowData: '-'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'च'),
                        TableRowData(rowData: 'z/zh'),
                        TableRowData(rowData: 'भ'),
                        TableRowData(rowData: '-'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'छ'),
                        TableRowData(rowData: 'c/ch'),
                        TableRowData(rowData: 'म'),
                        TableRowData(rowData: 'm'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'ज'),
                        TableRowData(rowData: '-'),
                        TableRowData(rowData: 'य'),
                        TableRowData(rowData: 'y'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'झ'),
                        TableRowData(rowData: '-'),
                        TableRowData(rowData: 'र'),
                        TableRowData(rowData: 'r'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'ञ'),
                        TableRowData(rowData: '-'),
                        TableRowData(rowData: 'ल'),
                        TableRowData(rowData: 'l'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'ट'),
                        TableRowData(rowData: '-'),
                        TableRowData(rowData: 'व '),
                        TableRowData(rowData: 'w'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'ठ'),
                        TableRowData(rowData: '-'),
                        TableRowData(rowData: 'श'),
                        TableRowData(rowData: 'sh'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'ड'),
                        TableRowData(rowData: '-'),
                        TableRowData(rowData: 'ष'),
                        TableRowData(rowData: '-'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'ढ'),
                        TableRowData(rowData: '-'),
                        TableRowData(rowData: 'स'),
                        TableRowData(rowData: 's'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'ण'),
                        TableRowData(rowData: '-'),
                        TableRowData(rowData: 'ह'),
                        TableRowData(rowData: 'h'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'त'),
                        TableRowData(rowData: 'd'),
                        TableRowData(rowData: 'क्ष'),
                        TableRowData(rowData: 'q'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'थ'),
                        TableRowData(rowData: 't'),
                        TableRowData(rowData: 'त्र'),
                        TableRowData(rowData: '-'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'द'),
                        TableRowData(rowData: 'd'),
                        TableRowData(rowData: 'ज्ञ'),
                        TableRowData(rowData: '-'),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Vowels',
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
                        TableRowData(rowData: 'Nepali'),
                        TableRowData(rowData: 'Roman'),
                        TableRowData(rowData: 'Nepali'),
                        TableRowData(rowData: 'Roman'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'अ'),
                        TableRowData(rowData: 'e'),
                        TableRowData(rowData: 'ए'),
                        TableRowData(rowData: 'ye'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'आ'),
                        TableRowData(rowData: 'a'),
                        TableRowData(rowData: 'ऐ'),
                        TableRowData(rowData: 'ei'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'इ'),
                        TableRowData(rowData: 'yi'),
                        TableRowData(rowData: 'ओ'),
                        TableRowData(rowData: 'o'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'ई'),
                        TableRowData(rowData: '-'),
                        TableRowData(rowData: 'औ'),
                        TableRowData(rowData: 'ou'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'उ'),
                        TableRowData(rowData: 'u'),
                        TableRowData(rowData: 'अं'),
                        TableRowData(rowData: 'on,eng'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: 'ऊ'),
                        TableRowData(rowData: '-'),
                        TableRowData(rowData: 'अः'),
                        TableRowData(rowData: '-'),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
