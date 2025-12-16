import 'package:flutter/material.dart';
import 'package:submission_dicoding/model/favorite.dart';
import 'package:submission_dicoding/screens/detail_screen.dart';
import 'package:submission_dicoding/widget/popular_list.dart';
import '../model/model.dart';
import 'favorite_screen.dart';
import 'search_screen.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  late List<Item> _randomItems;
  String query = '';

  @override
  void initState() {
    super.initState();

    _randomItems = List<Item>.from(itemList)..shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      buildHomePage(context),
      const FavoriteScreen(),
      const SearchScreen(),
    ];
    final results = itemList
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: _index == 0
            ? AppBar(
                systemOverlayStyle: SystemUiOverlayStyle.dark,
                scrolledUnderElevation: 0,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.white,
                elevation: 0,
                foregroundColor: Colors.black,
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.grid_view, size: 28),
                    SizedBox(
                      height: 40,
                      width: 300,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          prefixIcon: const Icon(Icons.search, size: 20),
                          suffixIcon: const Icon(Icons.mic, size: 20),

                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 40,
                            minHeight: 40,
                          ),
                          suffixIconConstraints: const BoxConstraints(
                            minWidth: 40,
                            minHeight: 40,
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.zero,

                          filled: true,
                          fillColor: Colors.white,

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                        ),
                        onChanged: (value) => setState(() => query = value),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.shopping_bag_outlined, size: 28),
                    ),
                  ],
                ),
              )
            : null,
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

  Widget buildHomePage(BuildContext context) {
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

            //widget popular list
            PopularList(
              items: popularItems,
              onRefresh: () {
                setState(() {});
              },
            ),

            const SizedBox(height: 18),
            Column(
              children: [
                _sectionHeader('Books For You'),

                const SizedBox(height: 12),
              ],
            ),

            Column(
              children: _randomItems.map((item) {
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

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (favoriteItems.contains(item)) {
                                favoriteItems.remove(item);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "${item.title} di hapus dari favorite",
                                    ),
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                              } else {
                                favoriteItems.add(item);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "${item.title} di tambahkan ke favoite",
                                    ),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
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
