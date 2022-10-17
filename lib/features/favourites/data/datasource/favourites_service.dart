import 'dart:io';
import 'package:chinese_learning/features/favourites/data/model/favourites_model.dart';
import 'package:http/http.dart' as http;

import '../../../../main.dart';

class FavouritesAPI {
  //post or remove favourites
  static Future addFavourites({required int? word}) async {
    var token = await secureStorage.readSecureData('token');
    final response = await http.post(
        Uri.parse("http://namaste-china-app.herokuapp.com/Api/Favourites/post/$word/"),
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
          Uri.parse("http://namaste-china-app.herokuapp.com/Api/Favourites/get/"),
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


