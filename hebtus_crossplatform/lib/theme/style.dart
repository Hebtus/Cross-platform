import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme(context) {
  return ThemeData(
    primaryColor: Colors.deepOrange,
    primarySwatch: Colors.orange,
    // textTheme: Theme.of(context)
    //     .textTheme
    //     .apply(bodyColor: Colors.black, displayColor: Colors.black),
    textTheme: GoogleFonts.soraTextTheme()
        .apply(bodyColor: Colors.black, displayColor: Colors.black),
  );
}
