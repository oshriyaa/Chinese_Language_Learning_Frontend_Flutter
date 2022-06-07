//results api model
import 'dart:convert';

List<ResultModel> resultModelFromJson(String str) => List<ResultModel>.from(
    json.decode(str).map((x) => ResultModel.fromJson(x)));

String resultModelToJson(List<ResultModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResultModel {
  int? id;
  int? user;
  String? testDate;
  String? testTime;
  String? level;
  int? result;

  ResultModel({
    this.id,
    this.user,
    this.testDate,
    this.testTime,
    this.level,
    this.result,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        id: json['id'],
        user: json['user'],
        testDate: json['testDate'],
        testTime: json['testTime'],
        level: json['level'],
        result: json['result'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user,
        'testDate': testDate,
        'testTime': testTime,
        'level': level,
        'result': result,
      };
}
