import 'package:chinese_learning/models/vocabulary_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../../network/api_service.dart';
import '../../colors/colors.dart';
import '../../styling/textstyle.dart';
import '../dashboard/landing_screen.dart';
import '../dashboard/sub_vocabulary/word_widget.dart';

class WordOfTheDay extends StatefulWidget {
  const WordOfTheDay({Key? key}) : super(key: key);

  @override
  State<WordOfTheDay> createState() => _WordOfTheDayState();
}

class _WordOfTheDayState extends State<WordOfTheDay> {
  late FlutterLocalNotificationsPlugin fltrNotification;

  @override
  void initState() {
    super.initState();
    var androidInitilize = new AndroidInitializationSettings('app_icon');
    //  var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings =
        //  new InitializationSettings(androidInitilize, iOSinitilize);
        new InitializationSettings(android: androidInitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: notificationSelected);
  }

  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "Channel ID", "Desi programmer",
        importance: Importance.high);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails);

    // await fltrNotification.show(
    //     0, "Task", "You created a Task", generalNotificationDetails,
    //     payload: "Task");

// ignore: deprecated_member_use

    var scheduledTime = DateTime.now().add(Duration(seconds: 5));
    fltrNotification.schedule(1, "Word of the day", "Check out today's word of the day.", scheduledTime,
        generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    List test = [1];
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.WHITE),
        backgroundColor: CustomColors.RED,
        title: const Text("Word of the day", style: StyleText.textAppBar),
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
        child: Column(
          children: [
            TextButton(
              onPressed: _showNotification,
              child: Text('Press'),
            ),
            Center(
                child: Text(
              "Word of the Day",
              style: StyleText.categoryHeading,
            )),
            FutureBuilder(
              future: DictionaryService().getMeaning(),
              builder:
                  (context, AsyncSnapshot<List<VocabularyModel>> snapshot) {
                // print('Data $snapshot');
                if (snapshot.hasData) {
                  int index = snapshot.data!.length - 1;
                  for (var i = 0; i < index; i++) {
                    print(i);
                    final data = snapshot.data![i];
                    String engWord = data.inEnglish!.toString().toLowerCase();

                    if (engWord == 'i') {
                      return WordWidget(
                        inEng: data.inEnglish!,
                        inNep: data.inNepali!,
                        inChi: data.inChinese!,
                        inPin: data.inPinYin!,
                        inDev: data.inDevnagari!,
                        audio: data.audio,
                        favPressed: () {
                          FavouritesAPI.addFavourites(word: (data.wordId));
                        },
                      );
                    } else {
                      const SizedBox(
                        height: 1,
                      );
                    }
                    ;
                  }
                  return const SizedBox(
                    height: 1,
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Future notificationSelected(String? payload) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Notification'),
      ),
    );
  }
}
