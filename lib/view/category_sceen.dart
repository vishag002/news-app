// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utilis/color_const.dart';
import 'package:news_app/utilis/text_const.dart';
import 'package:provider/provider.dart';

import '../controller/category_controller.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryController = Provider.of<CategryPageController>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: ColorConst.background,
        title: Text(
          "NewsX",
          style: GoogleFonts.abyssinicaSil(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: categoryController.objCategory.totalResults,
        itemBuilder: (context, index) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: double.infinity,
                // color: Colors.amberAccent,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: 140,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              categoryController.objCategory.articles?[index]
                                      .urlToImage ??
                                  "",
                            ),
                            fit: BoxFit.cover,
                            scale: 1,
                          ),
                        ),

                        // color: Colors.black,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          //   transformAlignment: Alignment.,
                          height: 135,
                          width: 220,
                          // color: Colors.cyan,
                          child: Text(
                            categoryController
                                    .objCategory.articles?[index].title ??
                                "",
                            overflow: TextOverflow.clip,
                            style: TextConst.heading,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            categoryController
                                    .objCategory.articles?[index].author ??
                                "",
                            overflow: TextOverflow.fade,
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
      ),
    );
  }
}
