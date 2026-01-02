import 'package:get/get.dart';
import 'package:submission_dicoding/model/model.dart';

class BooksController extends GetxController {
  final RxList<Item> _books = <Item>[].obs;

  @override
  void onInit() {
    super.onInit();
    _books.assignAll(itemList);
  }

  List<Item> get allBooks => _books;

  List<Item> get popularBooks =>
      _books.where((item) => item.isPopular).toList();

  List<Item> get shuflleBooks {
    final list = List<Item>.from(_books);
    list.shuffle();
    return list;
  }
}
