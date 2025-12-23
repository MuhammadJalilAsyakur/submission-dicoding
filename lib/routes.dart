import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:submission_dicoding/model/model.dart';
import 'package:submission_dicoding/screens/cart_screen.dart';
import 'package:submission_dicoding/screens/detail_screen.dart';
import 'package:submission_dicoding/screens/favorite_screen.dart';
import 'package:submission_dicoding/screens/home_screen.dart';
import 'package:submission_dicoding/screens/login_screen.dart';
import 'package:submission_dicoding/screens/search_page_screen.dart';
import 'package:submission_dicoding/screens/search_screen.dart';
import 'package:submission_dicoding/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (_) => const HomeScreen(),
  DetailScreen.routeName: (context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;

    return DetailScreen(item: item);
  },
  SplashScreen.routeName: (_) => const SplashScreen(),
  SearchScreen.routeName: (_) => const SearchScreen(),
  CartScreen.routeName: (_) => CartScreen(),
  SearchPageScreen.routeName: (_) => SearchPageScreen(),
  LoginScreen.routeName: (_) => LoginScreen(),
  FavoriteScreen.routeName: (_) => FavoriteScreen(),
};
