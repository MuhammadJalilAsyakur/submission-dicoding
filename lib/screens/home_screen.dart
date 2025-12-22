import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:submission_dicoding/model/model.dart';
import 'package:submission_dicoding/providers/books_provider.dart';
import 'package:submission_dicoding/providers/favorite_providers.dart';
import 'package:submission_dicoding/screens/cart_screen.dart';
import 'package:submission_dicoding/screens/detail_screen.dart';
import 'package:submission_dicoding/screens/search_page_screen.dart';
import 'package:submission_dicoding/widget/popular_list.dart';
import 'package:submission_dicoding/widget/vertical_book_card.dart'; // Import widget baru
import 'favorite_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  late List<Item> randomItems;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final items = context.read<BooksProvider>().items;
      randomItems = List<Item>.from(items)..shuffle();
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    // List halaman untuk BottomNav
    final pages = [
      _buildHomePageContent(context),
      const FavoriteScreen(),
      const SearchScreen(),
    ];

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        // AppBar Logic dipisah biar rapi
        appBar: _index == 0 ? _buildHomeAppBar() : null,
        body: pages[_index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          selectedItemColor: const Color(0xFF0D1B2A),
          backgroundColor: Colors.white,
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
      ),
    );
  }

  // Extracted Method: App Bar Home
  PreferredSizeWidget _buildHomeAppBar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.grid_view, size: 28, color: Colors.black),
          SizedBox(
            height: 40,
            width: 300,
            child: TextField(
              readOnly: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPageScreen(),
                  ),
                );
              },
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon: const Icon(Icons.search, size: 20),
                suffixIcon: const Icon(Icons.mic, size: 20),
                contentPadding: EdgeInsets.zero,
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.grey, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.grey, width: 1.5),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
            child: const Icon(
              Icons.shopping_bag_outlined,
              size: 28,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // Content Utama Home
  Widget _buildHomePageContent(BuildContext context) {
    final bookProvider = context.watch<BooksProvider>();
    final popularItems = bookProvider.popularItems;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionHeader(title: 'Popular Now', onShowAll: () {}),
            const SizedBox(height: 12),

            // Popular List
            PopularList(items: popularItems, onRefresh: () => setState(() {})),

            const SizedBox(height: 18),
            _SectionHeader(title: 'Books For You', onShowAll: () {}),
            const SizedBox(height: 12),
            Column(
              children: randomItems.map((item) {
                return Consumer<FavoriteProvider>(
                  builder: (context, favoriteProvider, _) {
                    return VerticalBookCard(
                      item: item,
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailScreen(item: item),
                          ),
                        );
                      },
                      onFavoriteToggle: () {
                        context.read<FavoriteProvider>().toggleFavorite(item);
                      },
                      isFavorite: favoriteProvider.isFavorite(item),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onShowAll;

  const _SectionHeader({required this.title, required this.onShowAll});

  @override
  Widget build(BuildContext context) {
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
        GestureDetector(
          onTap: onShowAll,
          child: Text(
            'Show All',
            style: TextStyle(
              color: Colors.green[700],
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    );
  }
}
