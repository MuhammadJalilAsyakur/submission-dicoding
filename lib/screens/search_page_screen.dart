import 'package:flutter/material.dart';
import 'package:submission_dicoding/model/model.dart';
import 'package:submission_dicoding/screens/detail_screen.dart';

class SearchPageScreen extends StatefulWidget {
  const SearchPageScreen({super.key});

  @override
  State<SearchPageScreen> createState() => _SearchPageScreenState();
}

class _SearchPageScreenState extends State<SearchPageScreen> {
  String query = '';

  List<Item> get filteredItems {
    if (query.isEmpty) return [];
    return itemList
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context), // Tombol back
        ),
        title: SizedBox(
          height: 40,
          child: TextField(
            autofocus: true, // <--- MAGIC-NYA DI SINI (Keyboard lgsg muncul)
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              hintText: 'Cari buku...',
              hintStyle: TextStyle(color: Colors.grey[500]),
              filled: true,
              fillColor: Colors.grey[100], // Sedikit beda biar kontras
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              suffixIcon: query.isNotEmpty
                  ? IconButton(
                      icon: const Icon(
                        Icons.clear,
                        size: 20,
                        color: Colors.grey,
                      ),
                      onPressed: () => setState(() => query = ''),
                    )
                  : null,
            ),
            onChanged: (value) {
              setState(() {
                query = value;
              });
            },
          ),
        ),
      ),
      body: query.isEmpty
          ? const Center(
              child: Text(
                "Cari buku favoritmu...",
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item.image,
                      width: 50,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    item.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(item.author),
                  onTap: () async {
                    // Masuk ke detail
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(item: item),
                      ),
                    );
                    setState(() {});
                  },
                );
              },
            ),
    );
  }
}
