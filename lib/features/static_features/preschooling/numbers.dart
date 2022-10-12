import 'package:flutter/material.dart';
import '../../../presentation/colors/colors.dart';
import '../../../presentation/screens/dashboard/landing_screen.dart';
import '../../../presentation/styling/textstyle.dart';
import 'table_row_data.dart';

class NumbersPage extends StatelessWidget {
  const NumbersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.L_RED,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: CustomColors.WHITE),
          backgroundColor: CustomColors.RED,
          title: const Text("Numbers and Strokes", style: StyleText.textAppBar),
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
                        TableRowData(rowData: '零'),
                        TableRowData(rowData: 'Zero'),
                        TableRowData(rowData: '0'),
                        TableRowData(rowData: 'लिङ्ग'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '一'),
                        TableRowData(rowData: 'One'),
                        TableRowData(rowData: '1'),
                        TableRowData(rowData: 'यी'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '二'),
                        TableRowData(rowData: 'Two'),
                        TableRowData(rowData: '2'),
                        TableRowData(rowData: 'अर'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '三'),
                        TableRowData(rowData: 'Three'),
                        TableRowData(rowData: '3'),
                        TableRowData(rowData: 'सान'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '四'),
                        TableRowData(rowData: 'Four'),
                        TableRowData(rowData: '4'),
                        TableRowData(rowData: 'सि'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '五'),
                        TableRowData(rowData: 'Five'),
                        TableRowData(rowData: '5'),
                        TableRowData(rowData: 'उ'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '六'),
                        TableRowData(rowData: 'Six'),
                        TableRowData(rowData: '6'),
                        TableRowData(rowData: 'ल्यु'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '七'),
                        TableRowData(rowData: 'Seven'),
                        TableRowData(rowData: '7'),
                        TableRowData(rowData: 'छी'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '八'),
                        TableRowData(rowData: 'Eight'),
                        TableRowData(rowData: '8'),
                        TableRowData(rowData: 'पा'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '九'),
                        TableRowData(rowData: 'Nine'),
                        TableRowData(rowData: '9'),
                        TableRowData(rowData: 'च्यु'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '十'),
                        TableRowData(rowData: 'Ten'),
                        TableRowData(rowData: '10'),
                        TableRowData(rowData: 'शि:'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '二十'),
                        TableRowData(rowData: 'Twenty'),
                        TableRowData(rowData: '20 '),
                        TableRowData(rowData: 'अर शि:'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '三十'),
                        TableRowData(rowData: 'Thirty'),
                        TableRowData(rowData: '30'),
                        TableRowData(rowData: 'सान शि:'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '四十'),
                        TableRowData(rowData: 'Fourty'),
                        TableRowData(rowData: '40'),
                        TableRowData(rowData: 'सि शि:'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '五十'),
                        TableRowData(rowData: 'Fifty'),
                        TableRowData(rowData: '50'),
                        TableRowData(rowData: 'उ शि:'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '六十'),
                        TableRowData(rowData: 'Sixty'),
                        TableRowData(rowData: '60'),
                        TableRowData(rowData: 'ल्यु शि:'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '七十'),
                        TableRowData(rowData: 'Seventy'),
                        TableRowData(rowData: '70'),
                        TableRowData(rowData: 'छी शि:'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '八十'),
                        TableRowData(rowData: 'Eighty'),
                        TableRowData(rowData: '80'),
                        TableRowData(rowData: 'पा शि:'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '九十'),
                        TableRowData(rowData: 'Ninety'),
                        TableRowData(rowData: '90'),
                        TableRowData(rowData: 'च्यु शि:'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '百'),
                        TableRowData(rowData: 'Hundred'),
                        TableRowData(rowData: '100'),
                        TableRowData(rowData: 'पाई'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '千'),
                        TableRowData(rowData: 'Thousand'),
                        TableRowData(rowData: '1000'),
                        TableRowData(rowData: '-'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '百万'),
                        TableRowData(rowData: 'Million'),
                        TableRowData(rowData: '1000000'),
                        TableRowData(rowData: '-'),
                      ]),
                      TableRow(children: [
                        TableRowData(rowData: '十亿'),
                        TableRowData(rowData: 'Billion'),
                        TableRowData(rowData: '100000000'),
                        TableRowData(rowData: '-'),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
