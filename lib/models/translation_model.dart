class TranslationModel {
  String? lang;
  String? text;
  String? result;

  TranslationModel({this.lang, this.text, this.result});

  TranslationModel.fromJson(Map<String, dynamic> json) {
    lang = json['lang'];
    text = json['text'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lang'] = this.lang;
    data['text'] = this.text;
    data['result'] = this.result;
    return data;
  }
}