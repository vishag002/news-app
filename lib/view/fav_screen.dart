import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  String searchValue = "";
  //
  final List<String> _suggestions = [
    'Afeganistan',
    'Albania',
    'Algeria',
    'Australia',
    'Brazil',
    'German',
    'Madagascar',
    'Mozambique',
    'Portugal',
    'Zambia'
  ];

  Future<List<String>> _fetchSuggestions(String searchValue) async {
    await Future.delayed(const Duration(milliseconds: 750));

    return _suggestions.where((element) {
      return element.toLowerCase().contains(searchValue.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          animationDuration: const Duration(milliseconds: 450),
          debounceDuration: const Duration(milliseconds: 400),
          title: Center(
              child:
                  const Text('Example', style: TextStyle(color: Colors.white))),
          onSearch: (value) => setState(() => searchValue = value),
          asyncSuggestions: (value) async => await _fetchSuggestions(value)),
      body: Center(
        child: Text(
          "favourite Screen",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
