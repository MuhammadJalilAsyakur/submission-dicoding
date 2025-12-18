import 'package:flutter/material.dart';
import 'package:submission_dicoding/model/model.dart';

class BooksProvider with ChangeNotifier {
  final List<Item> _items = itemList;

  List<Item> get items => _items;

  List<Item> get popularItems =>
      _items.where((item) => item.isPopular).toList();
}
