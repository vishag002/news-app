import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/model/my_model.dart';

class CategryPageController with ChangeNotifier {
  Map<String, dynamic> decodeData = {};
  MyClass objCategory = MyClass();
  bool isloading = false;

  //
  //category list
  final List categoryList = [
    "entertainment",
    "news",
    "business",
    "politics",
    "health",
    "lifestyle",
    "features",
    "international",
    "sports"
  ];
  //
  /* String _selectedCategory = '';

  String get selectedNews => _selectedCategory;

  void selectedNewsId(String index) {
    _selectedCategory = index;
    notifyListeners();
  } */

  Future categoryData({required int index}) async {
    String myNews = categoryList[index].toString();
    isloading = true;
    notifyListeners();
    final url = Uri.parse(
      "https://newsapi.org/v2/everything?q=$myNews&from=2024-05-01&sortBy=publishedAt&apiKey=b92820ab6aea47f694544921e3535770",
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      decodeData = jsonDecode(response.body);
      objCategory = MyClass.fromJson(decodeData);
    } else {
      print(response.statusCode.toString());
      print("invalid API");
    }
    isloading = false;
    notifyListeners();
  }
}
