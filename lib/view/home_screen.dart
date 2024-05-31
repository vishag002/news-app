import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/controller/home_screen_controler.dart';
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
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 1,
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          ),
        ),
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
              itemCount: homeScreenController.objClass.totalResults,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
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
                        homeScreenController.objClass.articles?[index].title ??
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
    );
  }
}
