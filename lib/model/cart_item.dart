import 'package:submission_dicoding/model/model.dart';

class CartItem {
  final Item item;
  int quantity;

  CartItem({required this.item, this.quantity = 1});
}
