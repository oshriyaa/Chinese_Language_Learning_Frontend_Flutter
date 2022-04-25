import 'dart:convert';
import 'dart:io';
import 'package:chinese_learning/models/favourites_model.dart';
import 'package:chinese_learning/models/results_model.dart';
import 'package:chinese_learning/models/translation_model.dart';
import 'package:chinese_learning/models/user_model.dart';
import 'package:chinese_learning/network/url.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../models/vocabulary_model.dart';
import 'package:intl/intl.dart';

class DictionaryService {
  Future<List<VocabularyModel>> getMeaning() async {
    try {
      final req = await http.get(Uri.parse("${FypEnv.URL_PREFIX}/vocabulary"));
      //If api request was successful
      if (req.statusCode == 200) {
        final vocabularyModel =
            vocabularyModelFromJson(utf8.decode(req.bodyBytes));
        return vocabularyModel;
      } else {
        final vocabularyModel = vocabularyModelFromJson(req.body);
        return vocabularyModel;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occured');
    }
  }
}

class AuthService {
  //API service for login
  static Future login(email, password) async {
    final String loginURL = FypEnv.loginURL;
    var requestBody = {'username': '$email', 'password': '$password'};
    var decodedResponse;
    //sending API request for login
    final response = await http.post(Uri.parse(loginURL),
        headers: <String, String>{
          'Content_Type': 'application/json',
        },
        body: requestBody);
    //if the login is successful
    if (response.statusCode == 200) {
      decodedResponse = json.decode(response.body);

      var token = decodedResponse['token'];
      secureStorage.writeSecureData(token);

      return decodedResponse;
    }
    //if the login is unseccessful
    return null;
  }

  //API service for Register
  static Future register(fullName, phoneNumber, email, password) async {
    var requestBody = {
      'email': '$email',
      'user_name': '$fullName',
      'phone_number': '$phoneNumber',
      'password': '$password'
    };
    var decodedResponse;

    final response = await http.post(Uri.parse(FypEnv.registerURL),
        headers: <String, String>{
          'Content_Type': 'application/json',
        },
        body: requestBody);

    if (response.statusCode == 201) {
      decodedResponse = json.decode(response.body);
      return decodedResponse;
    }
    return null;
  }
}

class TranslationAPI {
  static Future<TranslationModel?> getTranslation(
      {source, target, text}) async {
    var url = Uri.parse(
        'https://translation.googleapis.com/language/translate/v2?source=$source&key=AIzaSyDW8hzWVIuKfq_JZbqFtkL-w19g8P9xSgM&q=$text&target=$target');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      var data = TranslationModel.fromJson(decoded);
      return data;
    }
    return null;
  }
}

class FavouritesAPI {
  //post or remove favourites
  static Future addFavourites({required int? word}) async {
    var token = await secureStorage.readSecureData('token');
    String auth = 'Token $token';
    final response = await http.post(
        Uri.parse("http://10.0.2.2:8000/Api/Favourites/post/$word/"),
        headers: <String, String>{
          'Authorization': 'Token $token',
        });
    if ((response.statusCode as int) == 200) {
      return response.body;
    }
    return null;
  }

  //get favourites from api 
  Future<List<FavouritesModel>> getFavourites() async {
    try {
      var token = await secureStorage.readSecureData('token');
      String auth = 'Token $token';
      final response = await http.get(
          Uri.parse("http://10.0.2.2:8000/Api/Favourites/get/"),
          headers: <String, String>{
            'Authorization': 'Token $token',
          });
      if (response.statusCode == 200) {
        final vocabularyModel = favouritesModelFromJson(response.body);
        return vocabularyModel;
      } else {
        final vocabularyModel = favouritesModelFromJson(response.body);
        return vocabularyModel;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occured');
    }
  }
}

class UserDetailsAPI {
  Future<List<UserModel>> getUserDetails() async {
    try {
      var token = await secureStorage.readSecureData('token');
      print(token);
      String auth = 'Token $token';
      print("AUTH $auth");

      final response = await http.get(
          Uri.parse("http://10.0.2.2:8000/api/user/get_current_user/"),
          headers: <String, String>{
            'Authorization': 'Token $token',
          });

      if (response.statusCode == 200) {
        // print(response.body);
        final vocabularyModel = userModelFromJson(response.body);
        print("HERE");
        // print(vocabularyModel);

        return vocabularyModel;
      } else {
        print("fetch error");

        final vocabularyModel = userModelFromJson(response.body);

        return vocabularyModel;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occured');
    }
  }
}

class ResultsApi {
  static Future saveResults(
      {required int? result, required String? level}) async {
    String dateNow = DateFormat("yyyy-MM-dd").format(DateTime.now());
    String timeNow = DateFormat("hh:mm:ss").format(DateTime.now());
    var token = await secureStorage.readSecureData('token');

    String auth = 'Token $token';

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

    if ((response.statusCode as int) == 200) {
      print(response.body);
      return response.body;
    }
    return null;
  }

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
