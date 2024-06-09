import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utilis/text_const.dart';

class NewsViewScreen extends StatefulWidget {
  const NewsViewScreen({super.key});

  @override
  State<NewsViewScreen> createState() => _NewsViewScreenState();
}

class _NewsViewScreenState extends State<NewsViewScreen> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              size: 35,
              color: Colors.black,
            )),
        title: Text("NewsX",
            style: GoogleFonts.abyssinicaSil(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            )),
        //search button
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/images/car-reviews/first-drives/legacy/rolls_royce_phantom_top_10.jpg?itok=XjL9f1tx"), // Replace with a valid image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            "News Title will be shown here",
            style: TextConst.heading,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "News Description will be shown here. News Description will be shown here. "
              "News Description will be shown here. News Description will be shown here. "
              "News Description will be shown here. News Description will be shown here.",
              style: TextConst.description,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
          size: 50,
        ),
      ),
    );
  }
}
