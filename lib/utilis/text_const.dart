import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TextConst {
  static TextStyle heading = GoogleFonts.aBeeZee(
      textStyle: TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  ));
  static TextStyle titleText = GoogleFonts.alegreyaSans(
      textStyle: TextStyle(
    color: Colors.black,

    overflow: TextOverflow.ellipsis,

    //backgroundColor: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w500,
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
    fontSize: 15,
    fontWeight: FontWeight.bold,
  ));
  static TextStyle headingui = GoogleFonts.akayaTelivigala(
      textStyle: TextStyle(
    color: Colors.black,
    fontSize: 21,
    fontWeight: FontWeight.w500,
  ));
  static TextStyle underline_ui = GoogleFonts.allerta(
      textStyle: TextStyle(
          color: Colors.blue,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline));

  static TextStyle buttnText = GoogleFonts.alatsi(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  ));

  static TextStyle trendingHeading = GoogleFonts.alatsi(
      textStyle: TextStyle(
    color: Colors.white,
    backgroundColor: Colors.black38,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  ));

  static TextStyle searchText = GoogleFonts.amiri(
      textStyle: TextStyle(
    color: Colors.grey.shade900,
    //backgroundColor: Colors.amber,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  ));

  static TextStyle newsViewTitle = GoogleFonts.libreBaskerville(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle newsView = GoogleFonts.ebGaramond(
    color: Colors.black,
    fontSize: 21,
    fontWeight: FontWeight.w500,
  );
}
