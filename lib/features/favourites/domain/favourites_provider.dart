import 'package:chinese_learning/features/favourites/data/datasource/favourites_service.dart';
import 'package:chinese_learning/features/favourites/data/model/favourites_model.dart';
import 'package:flutter/cupertino.dart';

class FavouriteProvider extends ChangeNotifier {
  List<FavouritesModel> _favourites = [];
  List<FavouritesModel> get vocabulary => _favourites;

  fetchFavData() async {
    var allFavourites = await FavouritesAPI().getFavourites();
    _favourites = allFavourites;
    print(_favourites);
    notifyListeners();
  }
}
