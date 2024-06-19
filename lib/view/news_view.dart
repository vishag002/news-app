import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/news_class.dart';
import 'package:news_app/utilis/color_const.dart';
import 'package:news_app/utilis/text_const.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsViewScreen extends StatefulWidget {
  final News news;
  NewsViewScreen({super.key, required this.news});

  @override
  State<NewsViewScreen> createState() => _NewsViewScreenState();
}

class _NewsViewScreenState extends State<NewsViewScreen> {
  bool isFavorite = false;
  //url launcher

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(widget.news.url);

    print(widget.news.title);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorConst.background,
        elevation: 1,
        //toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              size: 35,
              color: ColorConst.primary,
            )),
        title: Text("NewsX",
            style: GoogleFonts.abyssinicaSil(
              textStyle: TextStyle(
                color: ColorConst.primary,
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
                  style: TextConst.newsViewTitle,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "   ${widget.news.descrition}",
                  style: TextConst.newsView,
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.news.content,
                        style: TextConst.newsView,
                      ),
                      WidgetSpan(
                          child: InkWell(
                        onTap: () {
                          launchUrl(
                            browserConfiguration:
                                BrowserConfiguration(showTitle: true),
                            mode: LaunchMode.inAppWebView,
                            webOnlyWindowName: "NewsX",
                            webViewConfiguration: WebViewConfiguration(),
                            url,
                          );
                        },
                        child: Text(
                          "   Read more....",
                          style: TextConst.underline_ui,
                        ),
                      )),
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
