import 'package:flutter/material.dart';
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
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        ],
      ),
    );
  }

  Widget buildHomePage(BuildContext context) {
    final popularItems =
        itemList.where((item) => item.isPopular == true).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionHeader('Popular Now'),
            const SizedBox(height: 12),

            PopularList(
              items: popularItems,
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
