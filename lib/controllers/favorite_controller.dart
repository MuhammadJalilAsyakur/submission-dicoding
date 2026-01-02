import 'package:get/get.dart';
import 'package:submission_dicoding/model/model.dart';

class FavoriteController extends GetxController {
  final RxList<Item> favoriteItems = <Item>[].obs;

  bool isFavorite(Item item) {
    return favoriteItems.any((e) => e.title == item.title);
  }

  void addFavorite(Item item) {
    favoriteItems.add(item);
    favoriteItems.refresh(); // opsional, tapi aman untuk update UI
  }

  void removeFavorite(Item item) {
    favoriteItems.removeWhere((e) => e.title == item.title);
    favoriteItems.refresh(); // opsional, tapi aman untuk update UI
  }

  void toggleFavorite(Item item) {
    if (isFavorite(item)) {
      removeFavorite(item);
    } else {
      addFavorite(item);
    }

    favoriteItems.refresh(); // opsional, tapi aman untuk update UI
  }
}
