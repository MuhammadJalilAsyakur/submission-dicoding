import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission_dicoding/controllers/books_controller.dart';
import 'package:submission_dicoding/controllers/cart_controller.dart';
import 'package:submission_dicoding/controllers/favorite_controller.dart';
import 'package:submission_dicoding/routes/app_pages.dart';
import 'package:submission_dicoding/screens/splash_screen.dart';

void main() {
  Get.put<CartController>(CartController());
  Get.put<FavoriteController>(FavoriteController());
  Get.put<BooksController>(BooksController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Submission Dicoding",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: SplashScreen.routeName,
      getPages: AppPages.routes,
    );
  }
}
