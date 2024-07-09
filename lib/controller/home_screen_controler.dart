import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/my_model.dart';

class HomeScreenController with ChangeNotifier {
  //country list
  final List<Map<String, String>> countries = [
    {'code': 'AE', 'name': 'United Arab Emirates'},
    {'code': 'AR', 'name': 'Argentina'},
    {'code': 'AT', 'name': 'Austria'},
    {'code': 'AU', 'name': 'Australia'},
    {'code': 'BE', 'name': 'Belgium'},
    {'code': 'BG', 'name': 'Bulgaria'},
    {'code': 'BR', 'name': 'Brazil'},
    {'code': 'CA', 'name': 'Canada'},
    {'code': 'CH', 'name': 'Switzerland'},
    {'code': 'CN', 'name': 'China'},
    {'code': 'CO', 'name': 'Colombia'},
    {'code': 'CU', 'name': 'Cuba'},
    {'code': 'CZ', 'name': 'Czech Republic'},
    {'code': 'DE', 'name': 'Germany'},
    {'code': 'EG', 'name': 'Egypt'},
    {'code': 'FR', 'name': 'France'},
    {'code': 'GB', 'name': 'United Kingdom'},
    {'code': 'GR', 'name': 'Greece'},
    {'code': 'HK', 'name': 'Hong Kong'},
    {'code': 'HU', 'name': 'Hungary'},
    {'code': 'ID', 'name': 'Indonesia'},
    {'code': 'IE', 'name': 'Ireland'},
    {'code': 'IL', 'name': 'Israel'},
    {'code': 'IN', 'name': 'India'},
    {'code': 'IT', 'name': 'Italy'},
    {'code': 'JP', 'name': 'Japan'},
    {'code': 'KR', 'name': 'South Korea'},
    {'code': 'LT', 'name': 'Lithuania'},
    {'code': 'LV', 'name': 'Latvia'},
    {'code': 'MA', 'name': 'Morocco'},
    {'code': 'MX', 'name': 'Mexico'},
    {'code': 'MY', 'name': 'Malaysia'},
    {'code': 'NG', 'name': 'Nigeria'},
    {'code': 'NL', 'name': 'Netherlands'},
    {'code': 'NO', 'name': 'Norway'},
    {'code': 'NZ', 'name': 'New Zealand'},
    {'code': 'PH', 'name': 'Philippines'},
    {'code': 'PL', 'name': 'Poland'},
    {'code': 'PT', 'name': 'Portugal'},
    {'code': 'RO', 'name': 'Romania'},
    {'code': 'RS', 'name': 'Serbia'},
    {'code': 'RU', 'name': 'Russia'},
    {'code': 'SA', 'name': 'Saudi Arabia'},
    {'code': 'SE', 'name': 'Sweden'},
    {'code': 'SG', 'name': 'Singapore'},
    {'code': 'SI', 'name': 'Slovenia'},
    {'code': 'SK', 'name': 'Slovakia'},
    {'code': 'TH', 'name': 'Thailand'},
    {'code': 'TR', 'name': 'Turkey'},
    {'code': 'TW', 'name': 'Taiwan'},
    {'code': 'UA', 'name': 'Ukraine'},
    {'code': 'US', 'name': 'United States'},
    {'code': 'VE', 'name': 'Venezuela'},
    {'code': 'ZA', 'name': 'South Africa'},
  ];

  /////////
  Map<String, dynamic> decodeData = {};
  MyClass objClass = MyClass();
  bool isloading = false;
  bool iserror = false;
  //
  Future fetchdata() async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=b92820ab6aea47f694544921e3535770");
    // "https://newsapi.org/v2/everything?q=featured&from=2024-05-26&sortBy=publishedAt&apiKey=b92820ab6aea47f694544921e3535770");

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
