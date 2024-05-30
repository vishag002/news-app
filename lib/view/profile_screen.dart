import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String searchValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
          searchBackgroundColor: Colors.black,
          showClearSearchIcon: true,
          putActionsOnRight: false,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          appBarHeight: 80,
          elevation: 0.09,
          debounceDuration: Duration(seconds: 3),
          animationDuration: Duration(milliseconds: 350),
          title: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text('Example'),
          ),
          leading: Icon(Icons.menu),
          onSearch: (value) => setState(() => searchValue = value)),
      body: Center(
        child: Text(
          "Profile Screen",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
