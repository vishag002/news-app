import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextConst {
  static TextStyle heading = GoogleFonts.aBeeZee(
      textStyle: TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  ));
  static TextStyle description = GoogleFonts.inconsolata(
      textStyle: TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  ));
  static TextStyle authorName = GoogleFonts.inconsolata(
      textStyle: TextStyle(
    color: Colors.black,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  ));
}
