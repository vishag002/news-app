/* // ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/controller/search_controller.dart';
import 'package:news_app/utilis/text_const.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchViewController = TextEditingController();
  /* @override
  void initState() {
    getData();
    super.initState();
  } */

  //
  /* Future<void> getData() async {
   
  } */

  @override
  Widget build(BuildContext context) {
    final searchPageController = Provider.of<SearchPageController>(context);

    return Scaffold(
        //backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          foregroundColor: Colors.white,
          toolbarHeight: 80,
          backgroundColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.all(28.0),
            child: TextField(
              //controller from provider
              controller: searchViewController,

              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.justify,
              cursorColor: Colors.white,
              showCursor: false,
              decoration: InputDecoration(
                // enabledBorder: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                  gapPadding: 50,
                ),
                focusColor: Colors.white,
                hoverColor: Colors.white,
                fillColor: Colors.amber,
                hintText: "Search here...",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                floatingLabelAlignment: FloatingLabelAlignment.center,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<SearchPageController>(context, listen: false)
                      .searchData(
                          searchingData:
                              searchViewController.text.toLowerCase());
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                  weight: 100,
                ))
          ],
        ),
        body: ListView.builder(
          itemCount: searchPageController.myObjClass.totalResults,
          itemBuilder: (context, index) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 205,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 150,
                          width: 130,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(searchPageController
                                      .myObjClass.articles?[index].urlToImage ??
                                  ""),
                              fit: BoxFit.cover,
                              scale: 1,
                            ),
                          ),
                          // color: Colors.black,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(height: 10),
                          Container(
                            //   transformAlignment: Alignment.,
                            // height: 135,
                            width: 220,
                            // color: Colors.cyan,
                            child: Text(
                              searchPageController
                                      .myObjClass.articles?[index].title ??
                                  "",
                              overflow: TextOverflow.fade,
                              style: TextConst.heading,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Container(
                            //color: Colors.amber,
                            height: 22,
                            width: 150,
                            child: Text(
                              searchPageController
                                      .myObjClass.articles?[index].author ??
                                  "",
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.clip,
                              style: TextConst.authorName,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
} */
