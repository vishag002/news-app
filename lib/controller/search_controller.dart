import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/model/my_model.dart';

class SearchPageController with ChangeNotifier {
  Map<String, dynamic> decodeData = {};
  MyClass myObjClass = MyClass();
  bool isloading = false;
  //
  Future searchData({required String searchingData}) async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchingData&from=2024-05-22&sortBy=publishedAt&apiKey=b92820ab6aea47f694544921e3535770");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      decodeData = jsonDecode(response.body);
      myObjClass = MyClass.fromJson(decodeData);
    } else {
      print(response.statusCode.toString());
      print("invalid API");
    }
    isloading = false;
    notifyListeners();
  }
}
