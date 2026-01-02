import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission_dicoding/controllers/favorite_controller.dart';
import '../model/model.dart';

class VerticalBookCard extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const VerticalBookCard({
    super.key,
    required this.item,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final favC = Get.find<FavoriteController>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. IMAGE
            Container(
              width: 90,
              height: 100,
              decoration: BoxDecoration(
                color: item.backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(item.image, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 12),

            // 2. TEXT INFO
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'By ${item.author}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Rating Stars
                  Row(children: _buildRatingStars(item.rating)),
                ],
              ),
            ),

            // 3. BOOKMARK BUTTON
            GestureDetector(
              onTap: onFavoriteToggle,
              child: Obx(() {
                return Icon(
                  favC.isFavorite(item)
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  size: 22,
                  color: favC.isFavorite(item) ? Colors.amber : Colors.black,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // Helper untuk bintang rating
  List<Widget> _buildRatingStars(double rating) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating.floor()) {
        stars.add(const Icon(Icons.star, color: Colors.amber, size: 18));
      } else if (i < rating) {
        stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 18));
      } else {
        stars.add(const Icon(Icons.star_border, color: Colors.amber, size: 18));
      }
    }
    stars.add(const SizedBox(width: 4));
    stars.add(Text(rating.toString(), style: const TextStyle(fontSize: 13)));
    return stars;
  }
}
