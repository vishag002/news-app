import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/my_model.dart';

import '../utilis/text_const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  Map<String, dynamic> decodeData = {};
  MyClass objClass = MyClass();
  //
  fetchdata() async {
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2024-04-29&sortBy=publishedAt&apiKey=b92820ab6aea47f694544921e3535770");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      decodeData = jsonDecode(response.body);
      objClass = MyClass.fromJson(decodeData);
      setState(() {});
    } else {
      print("invalid API");
    }
  }

  //
  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            size: 30,
            color: Colors.black,
          ),
        ),
        title: Text("NewsX",
            style: GoogleFonts.abyssinicaSil(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            )),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: objClass.totalResults,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            //  height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black12.withOpacity(.09),
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
                              objClass.articles![index].urlToImage ?? "",
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
                Text(
                  objClass.articles![index].title.toString(),
                  style: TextConst.heading,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    objClass.articles![index].description.toString(),
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
                        objClass.articles![index].author.toString(),
                        style: TextConst.authorName,
                      ),
                      Text(objClass.articles![index].publishedAt.toString()),
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
