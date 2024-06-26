import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/model/my_model.dart';
import 'package:news_app/view/invalidscreen.dart';

class CategryPageController with ChangeNotifier {
  Map<String, dynamic> decodeData = {};
  MyClass objCategory = MyClass();

  //
  //category list
  List<String> categoryList = [
    "Sports",
    "Entertainment",
    "Business",
    "Politics",
    "Health",
    "Lifestyle",
    "Features",
    "International",
  ];
  //

  Future categoryData({required int index}) async {
    String myNews = categoryList[index].toString();
    notifyListeners();
    final url = Uri.parse(
      "https://newsapi.org/v2/everything?q=$myNews&from=2024-05-26&sortBy=publishedAt&apiKey=b92820ab6aea47f694544921e3535770",
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      decodeData = jsonDecode(response.body);
      objCategory = MyClass.fromJson(decodeData);
    } else {
      InvalidErrorScreen();
      print(response.statusCode.toString());
      print("invalid API");
    }
    notifyListeners();
  }
}
