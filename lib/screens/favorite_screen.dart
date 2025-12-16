import 'package:flutter/material.dart';
import 'package:submission_dicoding/model/favorite.dart';
import 'package:submission_dicoding/screens/detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (favoriteItems.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bookmark_border, size: 60, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'GK ADA YANG LU BOOKMARK SETAN',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }
    return SafeArea(
      child: ListView.builder(
        itemCount: favoriteItems.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final item = favoriteItems[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailScreen(item: item)),
              );
            },
            child: Container(
              color: Colors.transparent,
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: Image.network(
                  item.image,
                  width: 50,
                  fit: BoxFit.contain,
                ),
                title: Text(
                  item.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(item.author),
                trailing: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (favoriteItems.contains(item)) {
                        favoriteItems.remove(item);
                      }
                    });
                  },
                  child: Icon(
                    favoriteItems.contains(item)
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    size: 22,
                    color: favoriteItems.contains(item)
                        ? Colors.amber
                        : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
