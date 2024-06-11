import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/news_class.dart';
import 'package:news_app/utilis/text_const.dart';

class NewsViewScreen extends StatefulWidget {
  final News news;
  NewsViewScreen({super.key, required this.news});

  @override
  State<NewsViewScreen> createState() => _NewsViewScreenState();
}

class _NewsViewScreenState extends State<NewsViewScreen> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    print(widget.news.title);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black.withOpacity(0.3)),
                    image: DecorationImage(
                      image: NetworkImage(widget.news.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 10),
                    Container(
                      width: 250,
                      //color: Colors.blueAccent,
                      child: Text(
                        widget.news.author,
                        overflow: TextOverflow.ellipsis,
                        style: TextConst.heading,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.news.title,
                  textAlign: TextAlign.justify,
                  style: TextConst.heading,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.news.descrition,
                  style: TextConst.description,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.news.content,
                        style: TextConst
                            .description, // First text style (e.g., normal)
                      ),
                      TextSpan(
                        text: "   Read more....",
                        style: TextConst
                            .underline_ui, // Second text style (e.g., bold)
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      /* floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        child: Icon(
          Icons.  ,
          color: Colors.red,
          size: 50,
        ),
      ), */
    );
  }
}
