import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  Style._();

  // ---------- Color   ---------- //

  static const primaryColor = Color(0xff0E9D57);
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const darkBgcolorOfApp = Color(0xff090A11);
  static const lightBgcolorOfApp = Color(0xffFAFAFD);
  static const greyColor65 = Color(0xffF2F2F3);
  static const greyColor90 = Color(0xff95969D);
  static const navBgcolorOfApp = Color(0xff121421);
  // ---------- Gradient   ---------- //

  // static const linearGradient = LinearGradient(
  //     begin: Alignment.bottomRight,
  //     end: Alignment.topLeft,
  //     colors: [
  //       Color(0xffFF1843),
  //       Color(0xffFF7E95),
  //     ]);

  static const primaryDisabledColor = Color.fromARGB(255, 132, 250, 193);

  static textStyleRegular({
    double size = 18,
    Color textColor = blackColor,
  }) =>
      GoogleFonts.poppins(
          fontWeight: FontWeight.w600, color: textColor, fontSize: size);

  static textStyleRegular2({
    double size = 16,
    Color textColor = blackColor,
  }) =>
      GoogleFonts.poppins(
          fontWeight: FontWeight.w600, color: textColor, fontSize: size);
}
