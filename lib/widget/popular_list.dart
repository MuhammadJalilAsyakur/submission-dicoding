import 'package:flutter/material.dart';
import 'package:submission_dicoding/model/model.dart';
import 'package:submission_dicoding/widget/popular_card.dart';

class PopularList extends StatelessWidget {
  final List<Item> items;

  const PopularList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 24),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return PopularCard(item: items[index]);
        },
      ),
    );
  }
}
