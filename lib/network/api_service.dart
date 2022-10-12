import 'dart:convert';
import 'dart:io';
import 'package:chinese_learning/models/favourites_model.dart';
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

class FavouritesAPI {
  //post or remove favourites
  static Future addFavourites({required int? word}) async {
    var token = await secureStorage.readSecureData('token');
    final response = await http.post(
        Uri.parse("http://10.0.2.2:8000/Api/Favourites/post/$word/"),
        headers: <String, String>{
          'Authorization': 'Token $token',
        });
    if ((response.statusCode) == 200) {
      return response.body;
    }
    return null;
  }

  //get favourites from api 
  Future<List<FavouritesModel>> getFavourites() async {
    try {
      var token = await secureStorage.readSecureData('token');
      final response = await http.get(
          Uri.parse("http://10.0.2.2:8000/Api/Favourites/get/"),
          headers: <String, String>{
            'Authorization': 'Token $token',
          });
          //if response is a success
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




