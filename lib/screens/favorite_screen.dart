import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_dicoding/providers/favorite_providers.dart';
import 'package:submission_dicoding/screens/detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
  static const routeName = '/favoritePage';

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = context.watch<FavoriteProvider>();
    final favoriteItems = favoriteProvider.favoriteItems;

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
              Navigator.pushNamed(
                context,
                DetailScreen.routeName,
                arguments: item,
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: Image.network(
                  item.image,
                  width: 50,
                  fit: BoxFit.contain,
                ),
                title: Text(
                  item.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(item.author),
                trailing: IconButton(
                  icon: Icon(
                    favoriteProvider.isFavorite(item)
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: favoriteProvider.isFavorite(item)
                        ? Colors.amber
                        : Colors.black,
                  ),
                  onPressed: () {
                    context.read<FavoriteProvider>().toggleFavorite(item);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
