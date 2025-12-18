import 'package:flutter/material.dart';
import 'package:submission_dicoding/model/model.dart';

class Books with ChangeNotifier {
  List<Item> _allItems = [];

  List<Item> get allItems {
    return [..._allItems];
  }
}
