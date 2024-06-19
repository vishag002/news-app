import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utilis/text_const.dart';
import 'package:news_app/view/search_view_screen.dart';
import 'package:provider/provider.dart';
import '../controller/category_controller.dart';
import '../controller/search_controller.dart';
import '../utilis/color_const.dart';

class NewSearchScreen extends StatefulWidget {
  const NewSearchScreen({super.key});

  @override
  State<NewSearchScreen> createState() => _NewSearchScreenState();
}

class _NewSearchScreenState extends State<NewSearchScreen> {
  //
  //
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

  //search
  final searchViewController = TextEditingController();
  void onSearchChanged(String value) {
    // Handle search logic here
    //dynamic searchtextController = value;
    //print(searchtextController.toString());
  }
  @override
  void initState() {
    //selectedCategory(selectedIndex);
    getCategoryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final searchPageController = Provider.of<SearchPageController>(context);
    final categoryController = Provider.of<CategryPageController>(context);
    print("selected index is $selectedIndex");
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
                        Provider.of<SearchPageController>(context,
                                listen: false)
                            .searchData(
                                searchingData:
                                    searchViewController.text.toLowerCase());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchViewScreen(
                                searchViewController: searchViewController.text,
                              ),
                            ));
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
            Container(
              height: 60,
              width: double.infinity,
              //color: Colors.amber.shade100,
              child: ChipList(
                listOfChipNames: categoryController.categoryList,

                activeBgColorList: [ColorConst.background],
                activeTextColorList: [ColorConst.primary],
                borderRadiiList: [30],
                axis: Axis.horizontal,
                inactiveBgColorList: [ColorConst.primary],
                inactiveBorderColorList: [ColorConst.background],
                inactiveTextColorList: [ColorConst.background],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                scrollPhysics: ClampingScrollPhysics(),
                //shouldWrap: true,
                style: TextConst.heading,
                supportsMultiSelect: false,
                showCheckmark: false,
                listOfChipIndicesCurrentlySelected: [selectedIndex],
                extraOnToggle: (index) {
                  selectedCategory(index);
                },
              ),
            ),
            Expanded(
              child: Container(
                width: w1,
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: h1 / 5,
                      width: w1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ColorConst.primary,
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
                                  image: NetworkImage(categoryController
                                          .objCategory
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
                                      categoryController.objCategory
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
                                      SizedBox(width: 10),
                                      Container(
                                        width: w1 / 2.6,
                                        //color: Colors.amber,
                                        child: Text(
                                          categoryController.objCategory
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
            )
          ],
        ),
      ),
    );
  }
}
