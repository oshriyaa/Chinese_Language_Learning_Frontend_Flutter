import 'dart:convert';
import 'dart:io';
import 'package:chinese_learning/features/favourites/data/model/favourites_model.dart';
import 'package:chinese_learning/models/translation_model.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

//Translation API
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


