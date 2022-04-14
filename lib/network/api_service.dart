import 'dart:convert';
import 'dart:io';
import 'package:chinese_learning/models/translation_model.dart';
import 'package:chinese_learning/network/url.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../models/vocabulary_model.dart';

class DictionaryService {
  List<VocabularyModel> results = [];
  Future<List<VocabularyModel>> getMeaning() async {
    try {
      final req = await http.get(Uri.parse("${FypEnv.URL_PREFIX}/vocabulary"));

      if (req.statusCode == 200) {
        final vocabularyModel =
            vocabularyModelFromJson(utf8.decode(req.bodyBytes));

        print('here2');

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
  static Future<TranslationModel?> getTranslation({String? word}) async {
    String? lang = 'en-zh';
    String? token = '5926e7dc213240d1f1959af9422617a9';

    var url = Uri.parse(
        'https://translate.hirak.site/?lang=$lang&txt=$word&token=$token');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      var decoded = json.decode(response.body);
      var data = TranslationModel.fromJson(decoded);
      print(data);
      return data;
      // } else {
      //   return Text("Please try again");
    }
    return null;
  }
}

