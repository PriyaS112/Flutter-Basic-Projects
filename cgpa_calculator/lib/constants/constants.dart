import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants{
  static const appColor = Colors.teal;
  static const String appTitle = 'CGPA Calculator';
  static final TextStyle titleStyle = GoogleFonts.quicksand(
      fontSize: 30, fontWeight: FontWeight.w900, color: appColor);

  static BorderRadius borderRadius = BorderRadius.circular(30);
  static BorderRadius buttonBorderRadius = BorderRadius.circular(20);

  static final TextStyle lectureStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: appColor);

  static final TextStyle averageStyle = GoogleFonts.quicksand(
      fontSize: 60, fontWeight: FontWeight.w800, color: appColor);

  static const dropDownPadding =
  EdgeInsets.symmetric(horizontal: 12, vertical: 8);

  static const childPadding = EdgeInsets.symmetric(horizontal: 8.0);
}