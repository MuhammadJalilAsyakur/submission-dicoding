import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:submission_dicoding/controllers/cart_controller.dart';
import 'package:submission_dicoding/widget/cart_item_card.dart';
import 'package:submission_dicoding/widget/cart_bottom_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = '/cartPage';

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
        ],
      ),
      body: Obx(() {
        final items = cartController.items;

        if (items.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_bag),
                SizedBox(height: 16),
                Text(
                  'ADAAA yang lu mau belii',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return CartItemCard(cartItem: items[index]);
                  },
                ),
              ),
              CartBottomBar(),
            ],
          ),
        );
      }),
    );
  }
}
