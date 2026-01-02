import 'package:get/state_manager.dart';
import 'package:submission_dicoding/model/cart_item.dart';
import 'package:submission_dicoding/model/model.dart';

class CartController extends GetxController {
  final RxList<CartItem> items = <CartItem>[].obs;

  void addItem(Item item) {
    final index = items.indexWhere((e) => e.item == item);

    if (index >= 0) {
      items[index].quantity++;
    } else {
      items.add(CartItem(item: item, quantity: 1));
    }
    items.refresh();
  }

  void incrementItem(Item item) {
    final index = items.indexWhere((e) => e.item == item);

    if (index >= 0) {
      items[index].quantity++;
      items.refresh();
    }
  }

  void decrementItem(Item item) {
    final index = items.indexWhere((e) => e.item == item);

    if (index >= 0 && items[index].quantity > 1) {
      items[index].quantity--;
      items.refresh();
    } else {
      items.removeAt(index);
    }
  }

  void clearCart() {
    items.clear();
    update();
  }

  double get totalPrice {
    return items.fold(
      0.0,
      (sum, cartItem) => sum + (cartItem.item.price * cartItem.quantity),
    );
  }
}
