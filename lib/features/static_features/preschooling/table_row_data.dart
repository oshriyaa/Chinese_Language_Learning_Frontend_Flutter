import 'package:flutter/material.dart';
import '../../../presentation/styling/textstyle.dart';

class TableRowData extends StatelessWidget {
  final String? rowData;
  const TableRowData({Key? key, this.rowData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          rowData!,
          style: StyleText.categoryHeading,
        ),
      ),
    );
  }
}

class SmallTableRowData extends StatelessWidget {
  final String? rowData;
  const SmallTableRowData({ Key? key , this.rowData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          rowData!,
          style: StyleText.featureSubHeading,
        ),
      ),
    );
  }
}
