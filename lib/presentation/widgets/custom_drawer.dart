import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:chinese_learning/presentation/screens/dashboard/client_info.dart';
import 'package:chinese_learning/presentation/screens/dashboard/sub_about/about.dart';

import 'package:chinese_learning/presentation/screens/other/favourites_screen.dart';
import 'package:chinese_learning/presentation/screens/other/search_screen.dart';
import 'package:chinese_learning/presentation/screens/other/word_of_the_day.dart';
import 'package:chinese_learning/presentation/styling/textstyle.dart';
import 'package:flutter/material.dart';

import '../../secure_storage/secure_storage.dart';
import 'logout_alert.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({ Key? key }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  final SecureStorage secureStorage = SecureStorage();
  bool? pressedLogout = false;

  Future openLogoutDialog() => showDialog(
        context: context,
        builder: (contex) => LogoutAlertDialog(
              
              imageLink: 'lib/assets/logoutLogo.png',
            ));

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
                        builder: (context) => AboutPage(),
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
                   buildDrawerItem(
                  text: "word of the day",
                  icon: Icons.favorite,
                  onClicked: () => selectedItem(context, 5)),
              Divider(
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
               buildDrawerItem(
                  text: "Logout",
                  icon: Icons.logout,
                  onClicked: () => selectedItem(context, 4))
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
              builder: (context) => AboutPage(),
            ));
        break;
       case 4:
        openLogoutDialog();
        break;
        case 5:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WordOfTheDay(),
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



