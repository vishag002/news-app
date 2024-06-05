import 'package:flutter/material.dart';
import 'package:news_app/controller/category_controller.dart';
import 'package:news_app/controller/home_screen_controler.dart';
import 'package:news_app/controller/search_controller.dart';
import 'package:news_app/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => HomeScreenController(),
    ),
    ChangeNotifierProvider(
      create: (context) => SearchPageController(),
    ),
    ChangeNotifierProvider(
      create: (context) => CategryPageController(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      //home: NavBarScree(),
    );
  }
}
