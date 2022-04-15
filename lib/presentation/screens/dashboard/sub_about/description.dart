import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/sub_about/history.dart';
import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:flutter/material.dart';

class AboutDescription extends StatelessWidget {
  const AboutDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Center(
              child: SizedBox(
                width: size.width * 0.9,
                child: const Text(
                  "Importance of Chinese Language",
                  style: StyleText.featureHeading,
                ),
              ),
            ),
          ),
          Container(
            child: Image.asset("lib/assets/importance.jpg"),
            // height: size.height * 0.25,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              color: CustomColors.RED,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                  offset: Offset(0, 0),
                ),
              ],
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
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
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                    child: Text(
                        "Mandarin/Chinese language is regarded as one of the most significant languages for improving commercial prospects throughout the world, owing to its powerful influence in the global corporate environment. There are approximately 1,197,000,000 people who speak Chinese, with 873,000 million speaking Mandarin. More than 70 states, including the United Kingdom, Russia, South Africa, Japan, South Korea, and Australia, have formally introduced Chinese language instruction into their national education systems. Outside of China, 20 million people are learning Chinese, and it has been named one of the official languages of the United Nations World Tourism Organization. According to a 2017 study conducted by the American Councils for International Education (ACIE), 227,086 students were enrolled in Chinese language classes, making Chinese the fourth most extensively taught foreign language in the K–12 system. The popularity of the Chinese language throughout the world is undeniable. ",
                        style: StyleText.featureSubHeading,
                        textAlign: TextAlign.justify),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                    child: Text(
                        "The increasing demand for the Chinese language has left a huge impact on Nepal. Nepal as a neighboring country to China, with uncountable business and economic possibilities already increases the need for communication. Over years, travel agencies and businesses have grown and adapted to learning Chinese to improve their communication with Chinese tourists and businesses. The importance of Chinese has been highlighted by schools as schools add Chinese as a mandatory subject for students. As bilateral commerce and investment rise, Nepali students are becoming more interested in studying in China. More than 6,400 Nepalis flew over the Himalayas to the north for higher education in 2017. With increasing businesses and tourism, the need for Chinese speakers in Nepal has also been increasing. ",
                        style: StyleText.featureSubHeading,
                        textAlign: TextAlign.justify),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: size.width * 0.8,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: CustomColors.RED,
                padding: const EdgeInsets.all(10.0),
                primary: Colors.black,
                textStyle: const TextStyle(fontSize: 15),
              ),
              child: const Text(
                "Learn Language History",
                style: TextStyle(
                    color: CustomColors.WHITE,
                    fontFamily: 'Bitter',
                    fontWeight: FontWeight.w200,
                    fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoryPage(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
