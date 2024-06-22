import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utilis/color_const.dart';
import 'package:news_app/utilis/text_const.dart';
import 'package:news_app/view/home_screen.dart';
import 'package:news_app/view/invalidscreen.dart';
import 'package:news_app/view/news_view.dart';
import 'package:news_app/view/search_screen_new.dart';
import 'package:provider/provider.dart';

import '../controller/category_controller.dart';
import '../controller/home_screen_controler.dart';
import '../model/news_class.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({super.key});

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  //featured news
  @override
  void initState() {
    getData();
    getCategoryData();
    super.initState();
  }

  //
  Future<void> getData() async {
    Provider.of<HomeScreenController>(context, listen: false).fetchdata();
  }

  //search controller
  TextEditingController searchtextController = TextEditingController();
  //category
  int selectedIndex = 0;
  void selectedCategory(int index) {
    setState(() {
      selectedIndex = index;
    });
    getCategoryData();
  }

  //
  Future<void> getCategoryData() async {
    Provider.of<CategryPageController>(context, listen: false)
        .categoryData(index: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenController = Provider.of<HomeScreenController>(context);
    final categoryController = Provider.of<CategryPageController>(context);
    final h1 = MediaQuery.of(context).size.height;
    final w1 = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        /* actions: [
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
        ], */
        backgroundColor: Colors.black,
        elevation: 1,
        toolbarHeight: 60,

        centerTitle: true,
        title: Text(
          "NewsX",
          style: GoogleFonts.abyssinicaSil(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        //search button
      ),
      body: homeScreenController.isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : homeScreenController.iserror
              ? InvalidErrorScreen()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      /* Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 55,
                width: w1,
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  border: Border.all(
                    color: ColorConst.background.withOpacity(.2),
                    strokeAlign: BorderSide.strokeAlignOutside,-
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
                        controller: searchtextController,
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
                          print("Search button pressed!");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ), */
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Featured",
                              style: TextConst.headingui,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ));
                              },
                              child: Text(
                                "see all",
                                style: TextConst.underline_ui,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: h1 / 3,
                          width: w1,
                          decoration: BoxDecoration(
                              //color: Colors.amber,
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: NetworkImage(
                                    homeScreenController
                                            .objClass.articles?[0].urlToImage ??
                                        "",
                                    scale: 1),
                                fit: BoxFit.cover,
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: h1 / 9,
                                  width: w1,
                                  //color: Colors.blue,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: h1 / 26,
                                        width: w1,
                                        //color: Colors.black,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          homeScreenController.objClass
                                                  .articles?[0].title ??
                                              "",
                                          style: TextConst.trendingHeading,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      NewsViewScreen(
                                                    news: News(
                                                      descrition:
                                                          homeScreenController
                                                                  .objClass
                                                                  .articles?[0]
                                                                  .description ??
                                                              "",
                                                      title:
                                                          homeScreenController
                                                                  .objClass
                                                                  .articles?[0]
                                                                  .title ??
                                                              "",
                                                      content:
                                                          homeScreenController
                                                                  .objClass
                                                                  .articles?[0]
                                                                  .content ??
                                                              "",
                                                      imageUrl:
                                                          homeScreenController
                                                                  .objClass
                                                                  .articles?[0]
                                                                  .urlToImage ??
                                                              "",
                                                      author:
                                                          homeScreenController
                                                                  .objClass
                                                                  .articles?[0]
                                                                  .author ??
                                                              "",
                                                      url: homeScreenController
                                                              .objClass
                                                              .articles?[0]
                                                              .url ??
                                                          "",
                                                    ),
                                                  ),
                                                ));
                                          },
                                          child: Container(
                                            height: h1 / 18,
                                            width: w1 / 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Read now",
                                                style: TextConst.buttnText,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "News",
                              style: TextConst.headingui,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NewSearchScreen(),
                                    ));
                              },
                              child: Text(
                                "see all",
                                style: TextConst.underline_ui,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        //color: Colors.amber.shade100,
                        child: ChipList(
                          listOfChipNames: categoryController.categoryList,
                          listOfChipIndicesCurrentlySelected: [selectedIndex],
                          activeBgColorList: [ColorConst.background],
                          activeTextColorList: [ColorConst.primary],
                          borderRadiiList: [30],
                          axis: Axis.horizontal,
                          inactiveBgColorList: [ColorConst.primary],
                          inactiveBorderColorList: [ColorConst.background],
                          inactiveTextColorList: [ColorConst.background],
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          scrollPhysics: ClampingScrollPhysics(),
                          extraOnToggle: (index) {
                            selectedCategory(index);
                          },
                          shouldWrap: false,
                          style: TextConst.heading,
                          supportsMultiSelect: false,
                          showCheckmark: false,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NewsViewScreen(
                                            news: News(
                                          title: categoryController.objCategory
                                                  .articles?[index].title ??
                                              "",
                                          content: categoryController
                                                  .objCategory
                                                  .articles?[index]
                                                  .content ??
                                              "",
                                          imageUrl: categoryController
                                                  .objCategory
                                                  .articles?[index]
                                                  .urlToImage ??
                                              "",
                                          author: categoryController.objCategory
                                                  .articles?[index].author ??
                                              "",
                                          url: categoryController.objCategory
                                                  .articles?[index].url ??
                                              "",
                                          descrition: categoryController
                                                  .objCategory
                                                  .articles?[index]
                                                  .description ??
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
                                      border: Border.all(
                                          color: Colors.grey.shade900
                                              .withOpacity(0.3))),
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
                                                bottomLeft:
                                                    Radius.circular(30)),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    categoryController
                                                            .objCategory
                                                            .articles?[index]
                                                            .urlToImage ??
                                                        ""),
                                                fit: BoxFit.cover,
                                                scale: 1)),
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
                                                  categoryController
                                                          .objCategory
                                                          .articles?[index]
                                                          .title ??
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
                                                  SizedBox(width: 10),
                                                  Container(
                                                    width: w1 / 2.6,
                                                    // color: Colors.amber,
                                                    child: Text(
                                                      categoryController
                                                              .objCategory
                                                              .articles?[index]
                                                              .author ??
                                                          "",
                                                      style:
                                                          TextConst.authorName,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
