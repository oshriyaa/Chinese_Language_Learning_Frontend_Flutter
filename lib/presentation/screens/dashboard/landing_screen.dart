import 'package:chinese_learning/network/api_service.dart';
import 'package:chinese_learning/network/dio_api.dart';
import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/feedback/feedback_page.dart';
import 'package:chinese_learning/presentation/screens/other/favourites_screen.dart';
import 'package:chinese_learning/presentation/widgets/logout_alert.dart';
import 'package:chinese_learning/presentation/screens/dashboard/sub_about/about.dart';
import 'package:chinese_learning/presentation/screens/dashboard/client_info.dart';
import 'package:chinese_learning/presentation/screens/dashboard/sub_preschooling.dart/preschooling.dart';
import 'package:chinese_learning/presentation/screens/dashboard/sub_test/test_page.dart';
import 'package:chinese_learning/presentation/screens/dashboard/translate_page.dart';
import 'package:chinese_learning/presentation/screens/login%20pages/login_screen.dart';

import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:flutter/material.dart';

import '../../../secure_storage/secure_storage.dart';
import '../../widgets/feature_tile.dart';
import '../../widgets/custom_drawer.dart';
import '../other/search_screen.dart';
import 'sub_vocabulary/category.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  var logoutResponse;
  final SecureStorage secureStorage = SecureStorage();
  bool? pressedLogout = false;

  Future openLogoutDialog() => showDialog(
      context: context,
      builder: (contex) => const LogoutAlertDialog(
            imageLink: 'lib/assets/logoutLogo.png',
            dialogText: 'Do you want to logout?',
          ));
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.WHITE),
        backgroundColor: CustomColors.RED,
        title: const Text("Namastey China", style: StyleText.textAppBar),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavouritesScreen(),
                    ));
            },
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FeatureContainer(
              tileTitle: "Preschooling",
              tileSubHeading:
                  "Start with learning letters, numbers and grammar.",
              image: 'lib/assets/learn.png',
              tapFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PreschoolingScreen(),
                    ));
              },
            ),
            FeatureContainer(
              tileTitle: "Vocabulary",
              tileSubHeading:
                  "Learn basic Chinese conversations with its pronunciation.",
              image: 'lib/assets/dictionary2.png',
              tapFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VocabularyScreen(),
                    ));
              },
            ),
            FeatureContainer(
              tileTitle: "Test",
              tileSubHeading:
                  "Take short quiz to test your knowledgein Chinese.",
              image: 'lib/assets/test.png',
              tapFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TestPage(),
                    ));
              },
            ),
            FeatureContainer(
              tileTitle: "Translate",
              tileSubHeading: "Translate from English to Chinese.",
              image: 'lib/assets/translate.png',
              tapFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TranslationPage(),
                    ));
              },
            ),
            FeatureContainer(
              tileTitle: "About",
              tileSubHeading: "Learn about Chinese history and its importance.",
              image: 'lib/assets/about.png',
              tapFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutPage(),
                    ));
              },
            ),
            FeatureContainer(
              tileTitle: "Han Da Institute",
              tileSubHeading: "Want to learn more?",
              image: 'lib/assets/client.png',
              tapFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ClientInformationPage(),
                    ));
              },
            ),
            FeatureContainer(
              tileTitle: "Feedback",
              tileSubHeading: "Send us your feedback and help us improve.",
              image: 'lib/assets/feedback.png',
              tapFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FeedbackPage(),
                    ));
              },
            ),
            FeatureContainer(
              tileTitle: "Logout",
              tileSubHeading: "We hope you enjoyed your stay. Visit us again.",
              image: 'lib/assets/logout.png',
              tapFunction: () {
                openLogoutDialog(
                  
                );
              },
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
