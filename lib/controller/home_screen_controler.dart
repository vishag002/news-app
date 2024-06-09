import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/my_model.dart';

class HomeScreenController with ChangeNotifier {
  Map<String, dynamic> decodeData = {};
  MyClass objClass = MyClass();
  bool isloading = false;
  //
  Future fetchdata() async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2024-05-09&sortBy=publishedAt&apiKey=b92820ab6aea47f694544921e3535770");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.statusCode.toString());

      decodeData = jsonDecode(response.body);
      objClass = MyClass.fromJson(decodeData);
    } else {
      print(response.statusCode.toString());
      print("invalid API");
    }
    isloading = false;
    notifyListeners();
  }
}
