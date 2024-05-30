import 'package:flutter/material.dart';

class NewsViewScreen extends StatelessWidget {
  const NewsViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.amber,
          ),
          Text("News Title will be shown here"),
          Text(
              "News Desciption will be shown here News Desciption will be shown hereNews Desciption will be shown hereNews Desciption will be,,News Desciption will be shown hereNews Desciption will be shown here")
        ],
      ),
    );
  }
}
