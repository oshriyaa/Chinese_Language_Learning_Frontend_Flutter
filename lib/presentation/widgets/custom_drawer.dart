import 'package:chinese_learning/features/authentication/data/model/user_model.dart';
import 'package:chinese_learning/features/profile/domain/profile_provider.dart';
import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/client_info.dart';
import 'package:chinese_learning/features/static_features/feedback/feedback_page.dart';
import 'package:chinese_learning/features/favourites/favourites_screen.dart';
import 'package:chinese_learning/features/profile/presentation/profile_screen.dart';
import 'package:chinese_learning/features/search/search_screen.dart';
import 'package:chinese_learning/presentation/screens/other/word_of_the_day.dart';
import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../features/profile/data/datasource/userdata_service.dart';
import '../../secure_storage/secure_storage.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final SecureStorage secureStorage = SecureStorage();
  bool? pressedLogout = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Drawer(
      child: SafeArea(
        child: Material(
          color: CustomColors.L_RED,
          child: ListView(
            // padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              Center(
                child: Consumer<ProfileProvider>(builder: ((context, provider, child) {
                  if (provider.userData == null) {
                    return buildHeader(name: "Loading...",  onClicked: (){});
                  }
                  final data = provider.userData![0];
                  print(data.email);
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: buildHeader(
                      name: data.userName!,
                      // username: data.email!,
                      onClicked: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          )),
                    ),
                  );
                })),
              ),
             
              const Divider(
                color: CustomColors.RED,
                thickness: 1,
              ),
              buildDrawerItem(
                  text: "Search",
                  icon: Icons.search,
                  onClicked: () => selectedItem(context, 0)),
              buildDrawerItem(
                  text: "Favourites",
                  icon: Icons.favorite,
                  onClicked: () => selectedItem(context, 1)),
              buildDrawerItem(
                  text: "word of the day",
                  icon: Icons.emoji_objects,
                  onClicked: () => selectedItem(context, 5)),
              const Divider(
                color: CustomColors.GREY,
              ),
              buildDrawerItem(
                  text: "Han Dao Institute",
                  icon: Icons.house,
                  onClicked: () => selectedItem(context, 2)),
              buildDrawerItem(
                  text: "Send Feedback",
                  icon: Icons.book,
                  onClicked: () => selectedItem(context, 3)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = CustomColors.RED;
    const hoverColor = CustomColors.RED;
    return ListTile(
      tileColor: CustomColors.L_RED,
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: StyleText.featureSubHeading,
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchScreen(),
            ));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FavouritesScreen(),
            ));
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ClientInformationPage(),
            ));
        break;
      case 3:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FeedbackPage(),
            ));
        break;

      case 5:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WordOfTheDay(),
            ));
        break;
    }
  }

  Widget buildHeader({
    required String name,
    required VoidCallback onClicked,
  }) {
    return ListTile(
      leading: const Icon(
        Icons.person,
        size: 50,
        color: CustomColors.RED,
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            name,
            style: StyleText.categoryHeading,
          ),
        ],
      ),
      onTap: onClicked,
    );
  }
}
