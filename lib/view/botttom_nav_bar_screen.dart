// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/utilis/color_const.dart';
import 'package:news_app/view/fav_screen.dart';
import 'package:news_app/view/profile_screen.dart';

import 'hs_new_ui.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int selectedTab = 0;
  //change tab
  changeTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  //pages list
  List pages = [
    NewHomeScreen(),
    FavouritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorConst.background,
          elevation: 5,
          iconSize: 30,
          unselectedItemColor: ColorConst.primary1,
          selectedItemColor: ColorConst.primary,
          currentIndex: selectedTab,
          showUnselectedLabels: false,
          onTap: (value) => changeTab(value),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "favourites"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
          ]),
    );
  }
}
