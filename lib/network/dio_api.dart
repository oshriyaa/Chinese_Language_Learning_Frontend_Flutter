import 'package:dio/dio.dart';

import '../models/vocabulary_model.dart';
import 'url.dart';

getHttp() async {
  List<VocabularyModel> results = [];
  try {
    Dio dio = new Dio();
    dio.options.baseUrl = "${FypEnv.URL_PREFIX}/vocabulary";
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 30000;
    Response response = await dio.get("${FypEnv.URL_PREFIX}/vocabulary");
 print(response);
    return response;
  } catch (e) {
    print(e);
  }
}
