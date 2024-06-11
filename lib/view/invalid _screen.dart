import 'package:flutter/material.dart';

class InvalidErrorScreen extends StatelessWidget {
  const InvalidErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Invalid Api ",
        ),
      ),
    );
  }
}
