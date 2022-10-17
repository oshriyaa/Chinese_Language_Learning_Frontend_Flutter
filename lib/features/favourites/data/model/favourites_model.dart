//favourites api model
import 'dart:convert';

List<FavouritesModel> favouritesModelFromJson(String str) =>
    List<FavouritesModel>.from(
        json.decode(str).map((x) => FavouritesModel.fromJson(x)));

String favouritesModelToJson(List<FavouritesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FavouritesModel {
  int? id;
  int? user;
  int? vocabulary;

  FavouritesModel({
    this.id,
    this.user,
    this.vocabulary,
  });

  factory FavouritesModel.fromJson(Map<dynamic, dynamic> json) =>
      FavouritesModel(
        id: json['id'],
        user: json['user'],
        vocabulary: json['vocabulary'],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "user": user,
        "vocabulary": vocabulary,
      };
}
