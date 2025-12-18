import 'package:flutter/material.dart';
import '../model/model.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Item> _favoriteItems = [];

  List<Item> get favoriteItems => _favoriteItems;

  bool isFavorite(Item item) {
    return _favoriteItems.any((e) => e.title == item.title);
  }

  void addFavorite(Item item) {
    _favoriteItems.add(item);
    notifyListeners();
  }

  void removeFavorite(Item item) {
    _favoriteItems.removeWhere((e) => e.title == item.title);
    notifyListeners();
  }

  void toggleFavorite(Item item) {
    if (isFavorite(item)) {
      removeFavorite(item);
    } else {
      addFavorite(item);
    }
  }
}
