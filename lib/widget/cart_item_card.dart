import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../model/cart_item.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;

  const CartItemCard({super.key, required this.cartItem});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              cartItem.item.image,
              width: 60,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Container(width: 60, height: 90, color: Colors.grey[300]),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.item.title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('By ${cartItem.item.author}', style: TextStyle()),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amberAccent, size: 16),
                    const SizedBox(width: 4),
                    Text(cartItem.item.rating.toString()),
                  ],
                ),
                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            context.read<CartProvider>().decrement(
                              cartItem.item,
                            );
                          },
                        ),

                        const SizedBox(width: 12),

                        Text(cartItem.quantity.toString()),
                        const SizedBox(width: 12),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            context.read<CartProvider>().increment(
                              cartItem.item,
                            );
                          },
                        ),

                        Text(
                          '\$${(cartItem.item.price * cartItem.quantity).toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.green[900],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
