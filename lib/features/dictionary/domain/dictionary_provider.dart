import 'package:chinese_learning/features/dictionary/data/datasource/vocabulary_service.dart';
import 'package:chinese_learning/features/dictionary/data/model/vocabulary_model.dart';
import 'package:flutter/material.dart';

class DictionaryProvider extends ChangeNotifier {
  List<VocabularyModel> _vocabulary = [];
   List<VocabularyModel>  get vocabulary => _vocabulary;

  fetchVocabulary() async {
    var allVocabulary = await DictionaryService().getMeaning();
    _vocabulary = allVocabulary;
    notifyListeners();
  }
}
