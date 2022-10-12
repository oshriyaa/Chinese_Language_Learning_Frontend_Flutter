import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../model/vocabulary_model.dart';

class DictionaryService {
  Future<dynamic> getMeaning() async {
    try {
      final req = await http.get(Uri.parse("http://namaste-china-app.herokuapp.com/vocabulary"));
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