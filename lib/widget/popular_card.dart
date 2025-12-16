import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:submission_dicoding/model/favorite.dart';
import 'package:submission_dicoding/screens/detail_screen.dart';
import 'package:submission_dicoding/model/model.dart';

class PopularCard extends StatefulWidget {
  final Item item;
  final VoidCallback? onRefresh;

  const PopularCard({super.key, required this.item, required this.onRefresh});

  @override
  State<PopularCard> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailScreen(item: widget.item)),
        );
      },
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 18, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: widget.item.backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        widget.item.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Text(
                        'By ${widget.item.author}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                // Di bagian Row paling bawah
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (favoriteItems.contains(widget.item)) {
                        favoriteItems.remove(widget.item);
                      } else {
                        favoriteItems.add(widget.item);
                      }
                      widget.onRefresh.call();
                    });
                  },
                  // --- KAMU LUPA MENAMBAHKAN INI ---
                  child: Icon(
                    favoriteItems.contains(widget.item)
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: favoriteItems.contains(widget.item)
                        ? Colors.green[700]
                        : Colors.grey,
                    size: 26,
                  ),

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
