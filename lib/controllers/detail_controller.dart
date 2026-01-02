import 'package:get/get.dart';
import 'package:submission_dicoding/model/model.dart';

class DetailController extends GetxController {
  late final Item item;
  var qty = 1.obs;

  @override
  void onInit() {
    super.onInit();
    item = Get.arguments as Item; 
  }

  void incrementQty() {
    qty++;
  }

  void decrementQty() {
    if (qty > 1) qty--;
  }
}
