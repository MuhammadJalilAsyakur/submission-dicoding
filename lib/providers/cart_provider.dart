
import 'package:flutter/material.dart';
import 'package:submission_dicoding/model/cart_item.dart';
import 'package:submission_dicoding/model/model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(Item item, int qty) {
    final index = _items.indexWhere((e) => e.item.title == item.title);

    if (index >= 0) {
      _items[index].quantity += qty;
    } else {
      _items.add(CartItem(item: item, quantity: qty));
    }

    notifyListeners();
  }

  void increment(Item item) {
    final index = _items.indexWhere((e) => e.item.title == item.title);

    if (index >= 0) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  void decrement(Item item) {
    final index = _items.indexWhere((e) => e.item.title == item.title);

    if (index >= 0 && _items[index].quantity > 1) {
      _items[index].quantity--;
    } else {
      _items.removeAt(index);
    }
    notifyListeners();
  }

  void remove(Item item) {
    _items.removeWhere((e) => e.item.title == item.title);
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(0, (sum, e) => sum + (e.item.price * e.quantity));
  }

  bool isInCart(Item item) {
    return _items.any((e) => e.item.title == item.title);
  }
}
