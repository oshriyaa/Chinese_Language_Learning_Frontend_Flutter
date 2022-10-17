import 'package:chinese_learning/features/test/data/datasource/result_service.dart';
import 'package:chinese_learning/features/test/data/model/results_model.dart';
import 'package:flutter/cupertino.dart';

class ResultProvider extends ChangeNotifier {
  List<ResultModel> _userResult = [];
  List<ResultModel> get userResult => _userResult;

  fetchUserResult() async {
    var results = await ResultsApi().getResults();
    _userResult = results;
    print(_userResult);
    notifyListeners();
  }
}
