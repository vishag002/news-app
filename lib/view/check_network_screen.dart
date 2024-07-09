import 'package:flutter/material.dart';

class CheckConnectionScreen extends StatelessWidget {
  const CheckConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: () {}, child: Text("No connection")),
      ),
    );
  }
}
