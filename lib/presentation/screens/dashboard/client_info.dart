import 'package:chinese_learning/presentation/screens/dashboard/landing_screen.dart';
import 'package:chinese_learning/presentation/widgets/custom_icon_botton.dart';
import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../styling/textstyle.dart';

class ClientInformationPage extends StatelessWidget {
  const ClientInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.WHITE),
        backgroundColor: CustomColors.RED,
        title: const Text("HanDo Institute", style: StyleText.textAppBar),
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
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
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
                height: size.height * 0.2,
                width: size.width * 0.9,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconButton(
                      save: () {},
                      buttonText: "Contact Us",
                      btnIcon: Icons.call,
                    ),
                    CustomIconButton(
                      save: () {},
                      buttonText: "Learn More",
                      btnIcon: Icons.travel_explore,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
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
                        "Han Da School is based in Shenzhen, China. Nepal International Registered Chinese Teachers Association is the cooperative recruitment in Nepal with a cooperative relationship with the Chinese Department of Lumbini Buddhist University. ",
                        style: StyleText.featureSubHeading,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Han Da Chinese is a Chinese language Institute and Consultancy in Kathmandu, Nepal.Han Da Chinese (Language Training Institute) is one of the best inclusive professional Chinese language training and business consultancy in Nepal. With their very own (International Chinese Language Teachers Association-ICLTA) or International Profession Certification Association-(IPA) trained teachers from China, there are various learning options to choose from.So far the pass rate of HSKⅡ is 100%, and the students from Han Da Chinese got the highest mark in HSKⅡ with a score of 200, which is the full mark.",
                        style: StyleText.featureSubHeading,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "With their mission to enable learner to build communication skills in Chinese so that they can pursue education, entrepreneurship and professionalism, they have been providing best Chinese learning experience with teachers that are native Chinese and who are professionally a teacher. They also recommend scholarship opportunities in Chinese universities, job placement to Chinese companies and give business consultancy in terms of China's trade with interpretation service, private one to one classes and so on.",
                        style: StyleText.featureSubHeading,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "If you are planning to take your Chinese a step furthur, Han Da Institute would be the perfect place to choose.",
                        style: StyleText.featureSubHeading,
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
