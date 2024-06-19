import 'package:flutter/material.dart';
import 'package:news_app/model/news_class.dart';
import 'package:news_app/utilis/text_const.dart';
import 'package:news_app/view/news_view.dart';
import 'package:provider/provider.dart';
import '../controller/search_controller.dart';
import '../utilis/color_const.dart';

class SearchViewScreen extends StatefulWidget {
  String searchViewController;
  SearchViewScreen({super.key, required this.searchViewController});

  @override
  State<SearchViewScreen> createState() => _SearchViewScreenState();
}

class _SearchViewScreenState extends State<SearchViewScreen> {
  final searchViewController = TextEditingController();
  //
  void onSearchButt() {
    Provider.of<SearchPageController>(context, listen: false)
        .searchData(searchingData: searchViewController.text.toLowerCase());
    // Handle search logic here
    //dynamic searchtextController = value;
    //print(searchtextController.toString());
  }

  @override
  void initState() {
    super.initState();
    onSearchButt();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.searchViewController);
    // print(searchPageController.objClass.articles?[0].title ?? "");
    final searchPageController = Provider.of<SearchPageController>(context);
    //print(searchtextController);
    final h1 = MediaQuery.of(context).size.height;
    final w1 = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 60,
              width: w1,
              decoration: BoxDecoration(
                // color: Colors.amber,
                border: Border.all(
                  color: ColorConst.background.withOpacity(.2),
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 2,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      showCursor: false,
                      // cursorHeight: 20,
                      controller: searchViewController,
                      style: TextConst.searchText,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        hintText: "Search here...",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 20),
                        counterStyle: TextConst.searchText,
                        disabledBorder: InputBorder.none,
                        hintStyle: TextConst.titleText,
                        /* border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ), */
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 30,
                      ),
                      onPressed: () {
                        onSearchButt();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News",
                    style: TextConst.headingui,
                  ),
                  /* InkWell(
                    onTap: () {},
                    child: Text(
                      "see all",
                      style: TextConst.underline_ui,
                    ),
                  ), */
                ],
              ),
            ),
            Container(),
            Expanded(
              child: Container(
                width: w1,
                child: ListView.builder(
                  itemCount: searchPageController.myObjClass.totalResults,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsViewScreen(
                                  news: News(
                                title: searchPageController
                                        .myObjClass.articles?[index].title ??
                                    "",
                                content: searchPageController
                                        .myObjClass.articles?[index].content ??
                                    "",
                                imageUrl: searchPageController.myObjClass
                                        .articles?[index].urlToImage ??
                                    "",
                                author: searchPageController
                                        .myObjClass.articles?[index].author ??
                                    "",
                                url: searchPageController
                                        .myObjClass.articles?[index].url ??
                                    "",
                                descrition: searchPageController.myObjClass
                                        .articles?[index].description ??
                                    "",
                              )),
                            ));
                      },
                      child: Container(
                        height: h1 / 5,
                        width: w1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: ColorConst.primary,
                            //color: Colors.amber,
                            border: Border.all(
                                color: Colors.grey.shade900.withOpacity(0.3))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: h1 / 5,
                              width: w1 / 2.6,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30)),
                                image: DecorationImage(
                                    image: NetworkImage(searchPageController
                                            .myObjClass
                                            .articles?[index]
                                            .urlToImage ??
                                        ""),
                                    fit: BoxFit.cover,
                                    scale: 1),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: w1 - w1 / 1.9,
                                height: h1 / 5,
                                //color: Colors.black,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  //  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      //height: h1 / 15,
                                      //color: Colors.amber,
                                      child: Text(
                                        maxLines: 2,
                                        searchPageController.myObjClass
                                                .articles?[index].title ??
                                            "",
                                        style: TextConst.titleText,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person_2,
                                          color: Colors.grey.shade700,
                                          size: 20,
                                        ),
                                        Container(
                                          width: w1 / 2.5,
                                          child: Text(
                                            searchPageController.myObjClass
                                                    .articles?[index].author ??
                                                "",
                                            style: TextConst.authorName,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
