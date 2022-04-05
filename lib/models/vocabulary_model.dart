// To parse this JSON data, do
//
//     final vocabularyModel = vocabularyModelFromJson(jsonString);

import 'dart:convert';

List<VocabularyModel> vocabularyModelFromJson(String str) => 
    List<VocabularyModel>.from(json.decode(str).map((x) => VocabularyModel.fromJson(x)));

String vocabularyModelToJson(List<VocabularyModel> data) => 
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class VocabularyModel {
    VocabularyModel({
        this.wordId,
        this.categoryId,
        this.inEnglish,
        this.inNepali,
        this.inChinese,
        this.inPinYin,
        this.inDevnagari,
        this.audio,
    });

    int? wordId;
    String? categoryId;
    String? inEnglish;
    String? inNepali;
    String? inChinese;
    String? inPinYin;
    String? inDevnagari;
    dynamic audio;

    factory VocabularyModel.fromJson(Map<String, dynamic> json) => VocabularyModel(
        wordId: json["WordID"],
        categoryId: json["CategoryID"],
        inEnglish: json["InEnglish"],
        inNepali: json["InNepali"],
        inChinese: json["InChinese"],
        inPinYin: json["InPinYin"],
        inDevnagari: json["InDevnagari"],
        audio: json["Audio"],
    );

    Map<String, dynamic> toJson() => {
        "WordID": wordId,
        "CategoryID": categoryId,
        "InEnglish": inEnglish,
        "InNepali": inNepali,
        "InChinese": inChinese,
        "InPinYin": inPinYin,
        "InDevnagari": inDevnagari,
        "Audio": audio,
    };
}

