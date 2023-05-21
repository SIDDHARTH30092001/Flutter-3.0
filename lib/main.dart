import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';

//import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),

      themeMode: ThemeMode.light,

      //MAKING ANOTHER FILE THEMES.DART FOR THIS
      // theme: ThemeData(
      //   primarySwatch: Colors.deepPurple,
      //   fontFamily: GoogleFonts.lato().fontFamily,
      //   appBarTheme: const AppBarTheme( //APP BAR THEME HERE FROM HOME PAGE
      //   color: Colors.transparent,
      //   elevation: 0.0,
      //   iconTheme: IconThemeData(
      //     color: Colors.black,
      //   ),
      //  // textTheme: Theme.of(context).textTheme, //DEPRICATED SHIT
      //  titleTextStyle: TextStyle(color: Colors.black)
      //   ),
      //   //primaryTextTheme: GoogleFonts.latoTextTheme()
      //   ),

      theme: MyTheme.lightTheme(context),

      // darkTheme: ThemeData(
      // brightness: Brightness.dark,
      // ),

      darkTheme: MyTheme.darkTheme(context),

      debugShowCheckedModeBanner: false,

      initialRoute: MyRoutes.homeRoute, //DEV PURPOSE SET ACCORDINGLY
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage()
      },
    );
  }
}
