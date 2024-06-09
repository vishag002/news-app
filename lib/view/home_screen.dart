// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/controller/category_controller.dart';
import 'package:news_app/controller/home_screen_controler.dart';
import 'package:news_app/view/category_sceen.dart';
import 'package:news_app/view/news_view.dart';
import 'package:news_app/view/search_screen.dart';
import 'package:provider/provider.dart';
import '../utilis/text_const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  @override
  void initState() {
    getData();
    super.initState();
  }

  //
  Future<void> getData() async {
    Provider.of<HomeScreenController>(context, listen: false).fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenController = Provider.of<HomeScreenController>(context);
    final categoryController = Provider.of<CategryPageController>(context);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ));
              },
              icon: Icon(
                Icons.search_rounded,
                color: Colors.white,
                size: 35,
              ))
        ],
        backgroundColor: Colors.black,
        elevation: 1,
        toolbarHeight: 80,

        centerTitle: true,
        title: Text("NewsX",
            style: GoogleFonts.abyssinicaSil(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            )),
        //search button
      ),
      body: homeScreenController.isloading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: homeScreenController.objClass.articles!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsViewScreen(),
                        ));
                  },
                  child: Container(
                    //  height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      //"https://overclockers.ru/st/legacy/blog/413830/520779_O.jpg"
                                      homeScreenController.objClass
                                              .articles?[index].urlToImage ??
                                          "",
                                      scale: 1),
                                  fit: BoxFit.cover),
                            ),
                            /* child: CachedNetworkImage(
                                imageUrl: homeScreenController
                                        .objClass.articles?[index].urlToImage ??
                                    "",
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ), */
                          ),
                        ),
                        Text(
                          homeScreenController
                                  .objClass.articles?[index].title ??
                              "",
                          style: TextConst.heading,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            homeScreenController
                                    .objClass.articles?[index].description ??
                                "",
                            style: TextConst.description,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                homeScreenController
                                        .objClass.articles?[index].author ??
                                    "",
                                overflow: TextOverflow.fade,
                                style: TextConst.authorName,
                              ),
                              Text(
                                  homeScreenController
                                          .objClass.articles?[index].publishedAt
                                          .toString() ??
                                      "",
                                  overflow: TextOverflow.fade),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      //drawer
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView.separated(
          itemBuilder: (context, index) => ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(),
                    ));
              },
              title: Text(
                categoryController.categoryList[index].toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
          separatorBuilder: (context, index) => Divider(
            thickness: 1,
            color: Colors.white.withOpacity(0.2),
            endIndent: 50,
          ),
          itemCount: categoryController.categoryList.length,
        ),
      ),
    );
  }
}

///////////
///
