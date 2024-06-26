import 'package:flutter/material.dart';
import 'package:news_app/controller/category_controller.dart';
import 'package:news_app/controller/home_screen_controler.dart';
import 'package:news_app/controller/search_controller.dart';
import 'package:news_app/view/check_network_screen.dart';
import 'package:news_app/view/hs_new_ui.dart';
import 'package:provider/provider.dart';

import 'controller/check_connection.dart';

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
    ),
    ChangeNotifierProvider(
      create: (context) => ConnectivityProvider(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<ConnectivityProvider>(
        builder: (context, connectivityProvider, child) {
          return connectivityProvider.isOnline
              ? NewHomeScreen()
              : CheckConnectionScreen();
        },
      ),
      //home: NavBarScree(),
    );
  }
}
