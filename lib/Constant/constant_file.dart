import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

myStyle(
    double fs, [Color ?Clr, FontWeight ?fw ]){
  return GoogleFonts.lato(
    fontSize: fs,
    color: Clr,
    fontWeight: fw,
  );
}
Color primaryColor= Colors.cyan;
Color secondaryColor= Colors.grey.shade300;