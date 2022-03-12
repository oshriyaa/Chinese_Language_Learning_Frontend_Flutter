import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/client_info.dart';
import 'package:chinese_learning/presentation/screens/other/about_us_screen.dart';
import 'package:chinese_learning/presentation/screens/other/favourites_screen.dart';
import 'package:chinese_learning/presentation/screens/other/search_screen.dart';
import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = "Oshriya Manandhar ";
    final email = "manandharoshriya@gmail.com";
    return Drawer(
      child: SafeArea(
        child: Material(
          color: CustomColors.L_RED,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: buildHeader(
                  name: name,
                  email: email,
                  onClicked: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutUsScreen(),
                      )),
                ),
              ),
              Divider(color: CustomColors.GREY,),
              buildDrawerItem(
                  text: "Search",
                  icon: Icons.search,
                  onClicked: () => selectedItem(context, 0)),
              buildDrawerItem(
                  text: "Favourites",
                  icon: Icons.favorite,
                  onClicked: () => selectedItem(context, 1)),
              Divider(
                color: CustomColors.GREY,
              ),
              buildDrawerItem(
                  text: "Han Dao Institute",
                  icon: Icons.house,
                  onClicked: () => selectedItem(context, 2)),
              buildDrawerItem(
                  text: "About Us",
                  icon: Icons.book,
                  onClicked: () => selectedItem(context, 3))
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
    final color = CustomColors.RED;
    final hoverColor = CustomColors.RED;
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
              builder: (context) => SearchScreen(),
            ));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavouritesScreen(),
            ));
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClientInformationPage(),
            ));
        break;
      case 3:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AboutUsScreen(),
            ));
        break;
    }
  }

  Widget buildHeader({
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) {
    return ListTile(
      leading: Icon(Icons.person, size: 50, color: CustomColors.RED,),
      title: Text(name, style: StyleText.categoryHeading,),
      subtitle: Text(email, style: StyleText.featureSubHeading,),
      onTap: onClicked,
    );
  }
}
