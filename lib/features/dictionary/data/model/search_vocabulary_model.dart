//Search API model
class SearchVocabulary {

     int? wordId;
    String? categoryId;
    String? inEnglish;
    String? inNepali;
    String? inChinese;
    String? inPinYin;
    String? inDevnagari;
    String? audio;

  SearchVocabulary({
    this.wordId,
        this.categoryId,
        this.inEnglish,
        this.inNepali,
        this.inChinese,
        this.inPinYin,
        this.inDevnagari,
        this.audio,
  });

  factory SearchVocabulary.formJson(Map<dynamic, dynamic> json) {
    return new SearchVocabulary(
      wordId: json["WordID"],
        categoryId: json["CategoryID"],
        inEnglish: json["InEnglish"],
        inNepali: json["InNepali"],
        inChinese: json["InChinese"],
        inPinYin: json["InPinYin"],
        inDevnagari: json["InDevnagari"],
        audio: json["Audio"],
    );
  }
}
