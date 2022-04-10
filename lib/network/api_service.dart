import 'dart:convert';
import 'dart:io';
import 'package:chinese_learning/models/translation_model.dart';
import 'package:chinese_learning/network/url.dart';
import 'package:http/http.dart' as http;
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

class TranslationAPI {
  static Future<TranslationModel?> getTranslation(
      {String? word }) async {
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
    }
    return null;
  }
}
