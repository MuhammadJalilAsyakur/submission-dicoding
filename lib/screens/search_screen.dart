import 'package:flutter/material.dart';
import '../model/model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    final results = itemList
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search items...",
                ),
                onChanged: (value) => setState(() => query = value),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: results.isEmpty
                    ? const Center(child: Text("Item not found"))
                    : ListView(
                        children: results
                            .map((e) => ListTile(title: Text(e.title)))
                            .toList(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
