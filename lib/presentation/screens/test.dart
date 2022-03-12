import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../styling/textstyle.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 170,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: CustomColors.WHITE,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 2,
                        offset: Offset(2, 2),
                      )
                    ]),
                child: ListTile(
                  trailing: SizedBox(
                    height: 170,
                    width: 150,
                    child: Image.asset("lib/assets/dictionary.png",
                        fit: BoxFit.cover),
                  ),
                  title: const Text(
                    "Dictionary",
                    style: StyleText.featureHeading,
                  ),
                  subtitle: const Text(
                    "Learn basic chinese conversation with its pronounciations",
                    style: StyleText.featureSubHeading,
                  ),
                  tileColor: Colors.blue,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 30.0),
                  // dense: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
