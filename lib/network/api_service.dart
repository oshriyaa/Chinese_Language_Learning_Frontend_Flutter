import 'dart:convert';
import 'dart:io';
import 'package:chinese_learning/models/favourites_model.dart';
import 'package:chinese_learning/models/translation_model.dart';
import 'package:chinese_learning/network/url.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../models/vocabulary_model.dart';

class DictionaryService {
  Future<List<VocabularyModel>> getMeaning() async {
    try {
      final req = await http.get(Uri.parse("${FypEnv.URL_PREFIX}/vocabulary"));

      if (req.statusCode == 200) {
        final vocabularyModel =
            vocabularyModelFromJson(utf8.decode(req.bodyBytes));

        print(vocabularyModel);

        return vocabularyModel;
      } else {
        print("fetch error");

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
    print("hereagain4");
    var requestBody = {
      'email': '$email',
      'user_name': '$fullName',
      'phone_number': '$phoneNumber',
      'password': '$password'
    };
    var decodedResponse;
    print("hereagain5");
    //sending API request for register
    final response = await http.post(Uri.parse(FypEnv.registerURL),
        headers: <String, String>{
          'Content_Type': 'application/json',
        },
        body: requestBody);
    print("hereagain1");
    //if register is successful

    print(response.statusCode);
    print("hereagain1");
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
    print("APICALL");
    print(target);
    print(source);

    // String target_code = target;
    // String source_code = source;
    var url = Uri.parse(
        'https://translation.googleapis.com/language/translate/v2?source=$source&key=AIzaSyDW8hzWVIuKfq_JZbqFtkL-w19g8P9xSgM&q=$text&target=$target');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      // var translatedText= decoded['data']['translations'][0]['translatedText'] ;

      var data = TranslationModel.fromJson(decoded);

      return data;
    }
    return null;
  }
}

class FavouritesAPI {
  static Future addFavourites({required int? word}) async {
    print("We are here");
    var token = await secureStorage.readSecureData('token');
    print(token);
    String auth = 'Token $token';
    print("AUTH HERE $auth");

    final response = await http.post(
        Uri.parse("http://10.0.2.2:8000/Api/Favourites/post/$word/"),
        headers: <String, String>{
          'Authorization': 'Token $token',
        });
    print("We are here");
    print("Code ${response.statusCode as int}");
    // body: requestBody);
    //if the login is successful
    if ((response.statusCode as int) == 200) {
      print("===============THIS=========");
      print(response.body);

      return response.body;
    }
    //if the login is unseccessful
    return null;
  }

Future<List<FavouritesModel>> getFavourites() async {
    try {
  var token = await secureStorage.readSecureData('token');
    print(token);
    String auth = 'Token $token';

    final response = await http.get(
        Uri.parse("http://10.0.2.2:8000/Api/Favourites/get/"),
        headers: <String, String>{
          'Authorization': 'Token $token',
        });

      if (response.statusCode == 200) {
        final vocabularyModel =
            favouritesModelFromJson(response.body);

        print(vocabularyModel);

        return vocabularyModel;
      } else {
        print("fetch error");

        final vocabularyModel = favouritesModelFromJson(response.body);

        return vocabularyModel;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occured');
    }
  }
  //  Future<List<FavouritesModel>> getFavourites() async {
  //   print("APICALL");
  //   var token = await secureStorage.readSecureData('token');
  //   print(token);
  //   String auth = 'Token $token';

  //   final response = await http.get(
  //       Uri.parse("http://10.0.2.2:8000/Api/Favourites/get/"),
  //       headers: <String, String>{
  //         'Authorization': 'Token $token',
  //       });

  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //      final vocabularyModel =
  //           vocabularyModelFromJson(response.body);

  //       print('here2');

  //       return vocabularyModel;
  //     // print("here");
  //     // print(response.body);
  //     // List<dynamic>  decoded = json.decode(response.body);
  //     // print("here333");
  //     // // var translatedText= decoded['data']['translations'][0]['translatedText'] ;

  //     // FavouritesModel favouritesModel = FavouritesModel.fromJson(decoded[0]);
  //     // print("here");
  //     // print(favouritesModel.vocabulary);
  //     // return favouritesModel;
  //   }
  //   // return null;
  // }
}
