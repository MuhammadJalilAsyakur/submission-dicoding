import 'package:flutter/material.dart';
import 'package:submission_dicoding/screens/detail_screen.dart';
import 'package:submission_dicoding/widget/popular_list.dart';
import '../model/model.dart';
import 'favorite_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      buildHomePage(context),
      const FavoriteScreen(),
      const SearchScreen(),
    ];

    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: const Color(0xFF0D1B2A),
        onTap: (value) => setState(() => _index = value),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        ],
      ),
    );
  }

  Widget buildHomePage(BuildContext context) {
    final randomItems = List<Item>.from(itemList)..shuffle();

    final popularItems = itemList
        .where((item) => item.isPopular == true)
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionHeader('Popular Now'),
            const SizedBox(height: 12),

            PopularList(items: popularItems),
            const SizedBox(height: 18),
            Column(
              children: [
                _sectionHeader('Books For You'),

                const SizedBox(height: 12),
              ],
            ),

            Column(
              children: randomItems.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(item: item),
                        ),
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 90,
                          height: 100,
                          decoration: BoxDecoration(
                            color: item.backgroundColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(item.image, fit: BoxFit.cover),
                          ),
                        ),

                        const SizedBox(width: 12),

                        // ===== TEXT =====
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
                              Row(
                                children: [
                                  ...List.generate(5, (index) {
                                    double rating = item.rating;

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
                                  const SizedBox(width: 4),
                                  Text(
                                    item.rating.toString(),
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // ===== BOOKMARK =====
                        const Icon(
                          Icons.bookmark_border,
                          size: 22,
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _sectionHeader(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
      ),
      Text(
        'Show All',
        style: TextStyle(
          color: Colors.green[700],
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
      ),
    ],
  );
}
