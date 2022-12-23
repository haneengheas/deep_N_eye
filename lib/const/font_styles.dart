import 'package:deep_n_eye/const/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle submitButtonStyle =
    GoogleFonts.cairo(fontSize: 25, fontWeight: FontWeight.bold, color: white);
TextStyle title = GoogleFonts.cairo(
    fontSize: 40, fontWeight: FontWeight.bold, color: darkPurple);
TextStyle title2 = GoogleFonts.cairo(
    fontSize: 40, fontWeight: FontWeight.w400, color: darkPurple);
TextStyle title3 = GoogleFonts.cairo(
    fontSize: 20, fontWeight: FontWeight.w400, color: darkPurple);
TextStyle title4 = GoogleFonts.cairo(
    fontSize: 25, fontWeight: FontWeight.w400, color: darkPurple);
TextStyle hintText = GoogleFonts.cairo(
    fontSize: 20, fontWeight: FontWeight.w300, color: lightGray);

BoxDecoration decoration = BoxDecoration(
    color: white4,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
      color: lightGray,
    ),
    boxShadow: [
      BoxShadow(
        color: white3,
        blurRadius: .5,
        spreadRadius: 2,
      )
    ]);
