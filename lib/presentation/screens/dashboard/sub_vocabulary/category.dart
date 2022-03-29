import 'package:chinese_learning/presentation/widgets/category_tile.dart';
import 'package:chinese_learning/presentation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import '../../../colors/colors.dart';
import '../../../styling/textstyle.dart';
import 'words_display_screen.dart';

class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.WHITE),
        backgroundColor: CustomColors.RED,
        title: const Text("Vocabulary", style: StyleText.textAppBar),
        // automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Column(
              children: [
                CategoryTileWidget(
                  tileTitle: "Pronouns and Adverbs",
                  icon: Icons.social_distance,
                  // image: "lib/assets/history.png",
                  tapFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WordDisplayScreen(categoryID: 'C1',),
                        ));
                  },
                ),
                CategoryTileWidget(
                  tileTitle: "Words and Expressions",
                  icon: Icons.translate,
                  // image: "lib/assets/history.png",
                  tapFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WordDisplayScreen(categoryID: 'C02',),
                        ));
                  },
                ),
                CategoryTileWidget(
                  tileTitle: "Greetings and Farewells",
                  icon: Icons.volunteer_activism,
                  // image: "lib/assets/history.png",
                  tapFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WordDisplayScreen(),
                        ));
                  },
                ),
                CategoryTileWidget(
                  tileTitle: "Family and Relations",
                  icon: Icons.family_restroom,
                  // image: "lib/assets/history.png",
                  tapFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WordDisplayScreen(),
                        ));
                  },
                ),
                CategoryTileWidget(
                  tileTitle: "Food and Beverages",
                  icon: Icons.fastfood,
                  // image: "lib/assets/history.png",
                  tapFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WordDisplayScreen(),
                        ));
                  },
                ),
                CategoryTileWidget(
                  tileTitle: "Birds and Animals",
                  icon: Icons.emoji_nature,
                  // image: "lib/assets/history.png",
                  tapFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WordDisplayScreen(),
                        ));
                  },
                ),
               
                 CategoryTileWidget(
                  tileTitle: "Parts of body",
                  icon: Icons.self_improvement,
                  // image: "lib/assets/history.png",
                  tapFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WordDisplayScreen(),
                        ));
                  },
                ),
                CategoryTileWidget(
                  tileTitle: "Day, Months and Seasons",
                  icon: Icons.calendar_month,
                  // image: "lib/assets/history.png",
                  tapFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WordDisplayScreen(),
                        ));
                  },
                ),
                 CategoryTileWidget(
                  tileTitle: "Countries and Citizens",
                  icon: Icons.flag,
                  // image: "lib/assets/history.png",
                  tapFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WordDisplayScreen(),
                        ));
                  },
                ),
                 CategoryTileWidget(
                  tileTitle: "Measurement and Quantities",
                  icon: Icons.scale,
                  // image: "lib/assets/history.png",
                  tapFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WordDisplayScreen(),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
