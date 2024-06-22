import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/my_model.dart';

class HomeScreenController with ChangeNotifier {
  Map<String, dynamic> decodeData = {};
  MyClass objClass = MyClass();
  bool isloading = false;
  bool iserror = false;
  //
  Future fetchdata() async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=featured&from=2024-05-22&sortBy=publishedAt&apiKey=b92820ab6aea47f694544921e3535770");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.statusCode.toString());

      decodeData = jsonDecode(response.body);
      objClass = MyClass.fromJson(decodeData);
    }
    /* else if (response.statusCode == 426) {
      InvalidErrorScreen();
    }  */
    else {
      iserror = true;
      print(response.statusCode.toString());
      print("invalid API");
    }
    isloading = false;
    notifyListeners();
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("error screen"),
      ),
    );
  }
}
