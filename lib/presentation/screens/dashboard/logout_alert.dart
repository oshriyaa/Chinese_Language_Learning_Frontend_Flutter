import 'package:flutter/material.dart';
import '../../../secure_storage/secure_storage.dart';
import '../../colors/colors.dart';
import '../login pages/login_screen.dart';

class LogoutAlertDialog extends StatelessWidget {
  final String? imageLink;
  const LogoutAlertDialog({Key? key, this.imageLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final SecureStorage secureStorage = SecureStorage();
    bool? pressedLogout = false;
    return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(10),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
                width: size.width * 0.9,
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: CustomColors.L_RED),
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Column(
                  children: const [
                    Text(
                      "Do you want to logout?",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Bitter',
                        color: CustomColors.RED,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                )),
            Positioned(
                top: 100,
                // right: 50,
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "NO",
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Bitter',
                            color: CustomColors.RED,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const SizedBox(
                      width: 50,
                    ),
                    TextButton(
                        onPressed: () {
                          pressedLogout = true;

                          secureStorage.deleteSecureData();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (Route<dynamic> route) => false);
                        },
                        child: const Text(
                          "YES",
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Bitter',
                            color: CustomColors.GREEN,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ],
                )),
            Positioned(
                top: -50, child: Image.asset(imageLink!, width: 90, height: 90))
          ],
        ));
  }
}
