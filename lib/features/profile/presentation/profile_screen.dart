import 'package:chinese_learning/features/test/data/model/results_model.dart';
import 'package:chinese_learning/features/test/domain/result_provider.dart';
import 'package:chinese_learning/presentation/screens/other/result_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../authentication/data/model/user_model.dart';
import '../../../presentation/colors/colors.dart';
import '../../../presentation/styling/textstyle.dart';
import '../../../presentation/screens/dashboard/landing_screen.dart';
import '../../test/data/datasource/result_service.dart';
import '../data/datasource/userdata_service.dart';
import '../domain/profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColors.WHITE),
        backgroundColor: CustomColors.RED,
        title: const Text("Profile", style: StyleText.textAppBar),
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
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Consumer<ProfileProvider>(
                builder: ((context, provider, child) {
                  if (provider.userData == null) {
                    return Container(
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
                      width: size.width * 0.9,
                      child: const CircularProgressIndicator(),
                    );
                  }
                  final data = provider.userData![0];
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Container(
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
                        width: size.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Text("Name: ${data.userName}",
                                    style: StyleText.testWhiteAnswerButtons),
                              ),
                              Text("UserName: ${data.email}",
                                  style: StyleText.testWhiteAnswerButtons),
                              Text("PhoneNumber: ${data.phoneNumber}",
                                  style: StyleText.testWhiteAnswerButtons),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
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
                  width: size.width * 0.9,
                  height: size.height * 0.55,
                  child: Column(children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Text("Saved Test Results",
                        style: TextStyle(
                            fontSize: 23,
                            fontFamily: 'Bitter',
                            color: CustomColors.WHITE,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: CustomColors.L_RED,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      width: size.width * 0.85,
                      height: size.height * 0.45,
                      child: SingleChildScrollView(
                        child: Consumer<ResultProvider>(
                            builder: ((context, provider, child) {
                          if (provider.userResult == null) {
                            return Text("No data");
                          }
                          return Text('Has data');
                        })),

                        // child: FutureBuilder(
                        //   future: ResultsApi().getResults(),
                        //   builder: (context,
                        //       AsyncSnapshot<List<ResultModel>> snapshot) {
                        //     if (snapshot.hasData) {
                        //       return Column(
                        //         children: List.generate(
                        //           snapshot.data!.length,
                        //           (index) {
                        //             final data = snapshot.data![index];
                        //             return ResultWidget(
                        //                 date: data.testDate,
                        //                 time: data.testTime,
                        //                 level: data.level,
                        //                 score: data.result,
                        //                 iconColor: data.level == 'easy'
                        //                     ? CustomColors.GREEN
                        //                     : data.level == 'medium'
                        //                         ? CustomColors.YELLOW
                        //                         : CustomColors.RED);
                        //           },
                        //         ),
                        //       );
                        //     } else if (snapshot.hasError) {
                        //       return Text(snapshot.error.toString());
                        //     } else {
                        //       return const Center(
                        //         child: Text(
                        //           "An error was caused while establishing connection",
                        //           style: StyleText.categoryHeading,
                        //         ),
                        //       );
                        //     }
                        //   },
                        // ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 160,
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                  color: CustomColors.L_RED,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person,
                  color: CustomColors.RED,
                  size: 100,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
