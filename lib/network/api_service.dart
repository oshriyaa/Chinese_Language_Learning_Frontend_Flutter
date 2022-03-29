import 'dart:convert';
import 'dart:io';
import 'package:chinese_learning/network/url.dart';
import 'package:http/http.dart' as http;
import '../models/vocabulary_model.dart';


class DictionaryService {
  Future<List<VocabularyModel>> getMeaning() async {
    try {
      final req = await http.get(Uri.parse("${FypEnv.URL_PREFIX}/vocabulary"));
      // print("got response");
      // print(req.statusCode);
      // print(req.body);
      // print(req.statusCode);

      if (req.statusCode == 200) {
        // print(req.body);

        final vocabularyModel =
            vocabularyModelFromJson(utf8.decode(req.bodyBytes));
        return vocabularyModel;
      } else {
        // print(req.body);
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



// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;

// import '../models/vocabulary_model.dart';

// class APIService {
//   Future<List<VocabularyModel>> getVocabulary() async {
//     var url = "http://127.0.0.1:8000/vocabulary";
    
//     try {
//       print("2");
//       var decodedResponse;
//       final response = await http.get(Uri.parse(url));
//       print("3");
//       print(response.statusCode);
//       print(response.body);
//       if (response.statusCode == 200) {
//         final res = json.decode(response.body);
//         final vocabularyModel = vocabularyModelFromJson(res);
//         return vocabularyModel;
//       } else {
//         final errorRes = json.decode(response.body);
//         final vocabularyModel = vocabularyModelFromJson(errorRes);
//         return vocabularyModel;
//       }
//       // } on SocketException catch (e) {
//       //   return Future.error("No Network found");
//     } catch (e) {
//       return Future.error("Something wrong");
//     }
//   }
// }
