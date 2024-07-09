// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextConst {
  static TextStyle heading = GoogleFonts.roboto(
      textStyle: TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  ));
  static TextStyle titleText = GoogleFonts.roboto(
      textStyle: TextStyle(
    color: Colors.black,

    overflow: TextOverflow.ellipsis,

    //backgroundColor: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  ));
  static TextStyle description = GoogleFonts.roboto(
      textStyle: TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  ));
  static TextStyle authorName = GoogleFonts.roboto(
      textStyle: TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  ));
  static TextStyle headingui = GoogleFonts.roboto(
      textStyle: TextStyle(
    color: Colors.black,
    fontSize: 21,
    fontWeight: FontWeight.w500,
  ));
  static TextStyle underlineui = GoogleFonts.roboto(
      textStyle: TextStyle(
          color: Colors.blue,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline));

  static TextStyle buttnText = GoogleFonts.roboto(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  ));

  static TextStyle trendingHeading = GoogleFonts.roboto(
      textStyle: TextStyle(
    color: Colors.white,
    backgroundColor: Colors.black38,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  ));

  static TextStyle searchText = GoogleFonts.roboto(
      textStyle: TextStyle(
    color: Colors.grey.shade900,
    //backgroundColor: Colors.amber,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  ));

  static TextStyle newsViewTitle = GoogleFonts.roboto(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle newsView = GoogleFonts.roboto(
    color: Colors.black,
    fontSize: 21,
    fontWeight: FontWeight.w500,
  );

  static TextStyle introWhiteFont = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 35,
    fontWeight: FontWeight.bold,
  );
  static TextStyle introRedFont = GoogleFonts.roboto(
    color: Colors.red,
    fontSize: 35,
    fontWeight: FontWeight.bold,
  );
  static TextStyle introBlackFont = GoogleFonts.roboto(
    color: Colors.black,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static TextStyle intro_skip = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
