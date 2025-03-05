import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MTextStyle {
  static TextStyle sf_pro_display(Color color) {
    return TextStyle(
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 18.2 / 14,
      color: color,
    );
  }

  static TextStyle sf_pro_display1(Color color) {
    return TextStyle(
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 19.2 / 16,
      color: color,
    );
  }

  static TextStyle sf_pro_display2(Color color) {
    return TextStyle(
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w700,
      fontSize: 30,
      letterSpacing: 6,
      color: color,
    );
  }

  static TextStyle sf_pro_display3(Color color) {
    return TextStyle(
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 18.8 / 16,
      color: color,
    );
  }
}
