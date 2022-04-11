// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'package:chinese_learning/models/translation_model.dart';
import 'package:chinese_learning/network/url.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../models/vocabulary_model.dart';

class DictionaryService {
  List<VocabularyModel> results = [];
  Future<List<VocabularyModel>> getMeaning({String? query}) async {
    try {
      final req = await http.get(Uri.parse("${FypEnv.URL_PREFIX}/vocabulary"));

      if (req.statusCode == 200) {
        final vocabularyModel =
            vocabularyModelFromJson(utf8.decode(req.bodyBytes));

        print('here2');
        print(query);
        if (query != null) {
          results = results
              .where((element) => element.inEnglish!
                  .toLowerCase()
                  .contains((query.toLowerCase())))
              .toList();
          print("here3");
          print(results);
        }
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
//LOGIN
  static Future login(email, password) async {
    print("HEREEEEE");
    final String loginURL = FypEnv.loginURL;
    var requestBody = {'username': '$email', 'password': '$password'};
    var decodedResponse;
    print("HEREEEEE22");
    final response = await http.post(Uri.parse(loginURL),
        headers: <String, String>{
          'Content_Type': 'application/json',
        },
        body: requestBody);
    print("HEREEEEE33");
    if (response.statusCode == 200) {
      print("HEREEEEE44");
      decodedResponse = json.decode(response.body);
      print(decodedResponse);
      var token = decodedResponse['token'];

      print('ACCESS TOKEN1 = $token');

      secureStorage.writeSecureData(token);
      print("RESPONSE = $decodedResponse");
      return decodedResponse;
    // } else {
    //   decodedResponse = "Something went wrong";
    //   return decodedResponse;
    }
    return null;
  }

  static Future register(email, fullName, phoneNumber, password) async {
    var requestBody = {
      'email-address': '$email',
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
    if (response.statusCode == 200) {
      decodedResponse = json.decode(response.body);

      if (decodedResponse["status"] == "success") {
        print('STATUS SUCCESS $decodedResponse');

        return decodedResponse;
      }
    }
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
