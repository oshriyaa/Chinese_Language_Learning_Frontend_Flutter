import 'package:chinese_learning/features/static_features/preschooling/tones.dart';
import 'package:chinese_learning/presentation/widgets/category_tile.dart';
import 'package:flutter/material.dart';

import '../../../presentation/colors/colors.dart';
import '../../favourites/favourites_screen.dart';
import '../../search/search_screen.dart';
import '../../../presentation/styling/textstyle.dart';
import '../../../presentation/widgets/custom_drawer.dart';
import 'chinese_alphabets.dart';
import 'nepali_alphabets.dart';
import 'numbers.dart';

class PreschoolingScreen extends StatefulWidget {
  const PreschoolingScreen({Key? key}) : super(key: key);

  @override
  State<PreschoolingScreen> createState() => _PreschoolingScreenState();
}

class _PreschoolingScreenState extends State<PreschoolingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.L_RED,
        drawer: const CustomDrawer(),
       appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.WHITE),
        backgroundColor: CustomColors.RED,
        title: const Text("Preschooling", style: StyleText.textAppBar),
        // automaticallyImplyLeading: false,
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                CategoryTileWidget(
                  tileTitle: "Chinese Alphabets",
                  icon: Icons.translate,
                  // image: "lib/assets/history.png",
                  tapFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChineseAlphabetPage(),
                        ));
                  },
                ),
                CategoryTileWidget(
                  tileTitle: "Nepali Alphabets",
                  icon: Icons.local_library,
                  // image: "lib/assets/history.png",
                  tapFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NepaliAlphabetPage(),
                        ));
                  },
                ),
                CategoryTileWidget(
                  tileTitle: "Numbers and Strokes",
                  icon: Icons.pin,
                  // image: "lib/assets/history.png",
                  tapFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NumbersPage(),
                        ));
                  },
                ),
                CategoryTileWidget(
                  tileTitle: "Tones",
                  icon: Icons.music_note,
                  // image: "lib/assets/history.png",
                  tapFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TonesPage(),
                        ));
                  },
                )
              ],
            ),
          ),
        ));
  }
}
