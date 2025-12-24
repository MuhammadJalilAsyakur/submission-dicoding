import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:submission_dicoding/providers/cart_provider.dart';
import 'package:submission_dicoding/providers/favorite_providers.dart';
import 'package:submission_dicoding/screens/cart_screen.dart';
import '../model/model.dart';

class DetailScreen extends StatefulWidget {
  final Item item;
  static const routeName = '/detailPage';

  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 700) {
            return _wideLayout();
          }
          return _mobileLayout(context);
        },
      ),
    );
  }

  Widget _mobileLayout(BuildContext context) {
    final favoriteProvider = context.watch<FavoriteProvider>();

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Card(
                elevation: 0,
                shadowColor: Colors.transparent,
                color: widget.item.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 16,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              widget.item.image,
                              width: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            widget.item.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 6),
                          Text(
                            'by ${widget.item.author}',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              double rating = widget.item.rating;

                              if (index < rating.floor()) {
                                return Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18,
                                );
                              } else if (index < rating) {
                                return Icon(
                                  Icons.star_half,
                                  color: Colors.amber,
                                  size: 18,
                                );
                              } else {
                                return Icon(
                                  Icons.star_border,
                                  color: Colors.amber,
                                  size: 18,
                                );
                              }
                            }),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: Get.back,
                        ),
                      ),
                    ),

                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: Icon(
                            favoriteProvider.isFavorite(widget.item)
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                          ),
                          color: favoriteProvider.isFavorite(widget.item)
                              ? Colors.amberAccent
                              : Colors.grey,
                          onPressed: () {
                            context.read<FavoriteProvider>().toggleFavorite(
                              widget.item,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Text(
                        '\$${widget.item.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.green[900],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(widget.item.description),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFE9F4EF), // hijau muda soft
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "QTY",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: 16),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (qty > 1) {
                                  qty -= 1;
                                }
                              });
                            },
                            child: Icon(
                              Icons.remove,
                              color: Colors.green,
                              size: 22,
                            ),
                          ),

                          // QTY NUMBER
                          Text(
                            "$qty",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800],
                            ),
                          ),

                          // PLUS BUTTON
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                qty += 1;
                              });
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.green,
                              size: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 16),

                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CartProvider>().addToCart(
                          widget.item,
                          qty,
                        );
                        Get.toNamed(CartScreen.routeName);
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[900],
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Add To Cart",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _wideLayout() {
    return Row(
      children: [
        Expanded(
          child: Hero(
            tag: widget.item.title,
            child: Image.network(widget.item.image),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Text(widget.item.description),
          ),
        ),
      ],
    );
  }
}
