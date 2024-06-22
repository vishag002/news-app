import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InvalidErrorScreen extends StatelessWidget {
  const InvalidErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "News not found ",
          style: GoogleFonts.aBeeZee(
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
            fontSize: 20,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
