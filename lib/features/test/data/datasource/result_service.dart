import 'dart:io';
import 'package:chinese_learning/features/test/data/model/results_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../../main.dart';

//Results API
class ResultsApi {
  //Adding results 
  static Future saveResults(
      {required int? result, required String? level}) async {
        //Current date and time
    String dateNow = DateFormat("yyyy-MM-dd").format(DateTime.now());
    String timeNow = DateFormat("hh:mm:ss").format(DateTime.now());
    var token = await secureStorage.readSecureData('token');


    final response = await http.post(
      Uri.parse("http://10.0.2.2:8000/api/results/post/"),
      headers: <String, String>{
        'Authorization': 'Token $token',
      },
      body: {
        'testDate': dateNow,
        'testTime': timeNow,
        'level': '$level',
        'result': '$result'
      },
    );

    if ((response.statusCode) == 200) {
      print(response.body);
      return response.body;
    }
    return null;
  }

  //Get results data
  Future<List<ResultModel>> getResults() async {
    try {
      var token = await secureStorage.readSecureData('token');
      print(token);
      String auth = 'Token $token';
      print("AUTH $auth");

      final response = await http.get(
          Uri.parse("http://10.0.2.2:8000/api/results/get/"),
          headers: <String, String>{
            'Authorization': 'Token $token',
          });

      if (response.statusCode == 200) {
        final vocabularyModel = resultModelFromJson(response.body);
        print("HERE");
        return vocabularyModel;
      } else {
        print("fetch error");
        final vocabularyModel = resultModelFromJson(response.body);
        return vocabularyModel;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occured');
    }
  }
}