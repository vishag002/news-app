import 'package:flutter/material.dart';
import 'package:news_app/view/botttom_nav_bar_screen.dart';

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
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NavBarScreen(),
                ));
          },
          child: Text(
            "Profile Screen",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
