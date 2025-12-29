import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:submission_dicoding/controllers/cart_controller.dart';
import 'package:submission_dicoding/providers/books_provider.dart';
import 'package:submission_dicoding/providers/cart_provider.dart';
import 'package:submission_dicoding/providers/favorite_providers.dart';
import 'package:submission_dicoding/routes/app_pages.dart';
import 'package:submission_dicoding/screens/splash_screen.dart';

void main() {
  Get.lazyPut<CartController>(() => CartController(), fenix: true);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => BooksProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
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
