import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: const AppBarTheme(
            //APP BAR THEME HERE FROM HOME PAGE
            color: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            // textTheme: Theme.of(context).textTheme, //DEPRICATED SHIT
            titleTextStyle: TextStyle(color: Colors.black,fontSize: 16.0),
            ),
        //primaryTextTheme: GoogleFonts.latoTextTheme()
      );

      static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );
}
