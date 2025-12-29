import 'package:get/get.dart';
import 'package:submission_dicoding/screens/cart_screen.dart';
import 'package:submission_dicoding/screens/detail_screen.dart';
import 'package:submission_dicoding/screens/favorite_screen.dart';
import 'package:submission_dicoding/screens/home_screen.dart';
import 'package:submission_dicoding/screens/login_screen.dart';
import 'package:submission_dicoding/screens/search_page_screen.dart';
import 'package:submission_dicoding/screens/search_screen.dart';
import 'package:submission_dicoding/screens/splash_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: DetailScreen.routeName,
      page: () => DetailScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: CartScreen.routeName,
      page: () => const CartScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: FavoriteScreen.routeName,
      page: () => const FavoriteScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 300),
    ),
    GetPage(name: LoginScreen.routeName, page: () => const LoginScreen(),), 
    GetPage(
      name: SearchPageScreen.routeName,
      page: () => const SearchPageScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: SearchScreen.routeName,
      page: () => const SearchScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
