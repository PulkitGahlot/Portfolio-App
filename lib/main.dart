import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/home_screen.dart';

void main() {
  runApp(MyPortfolioApp());
}

class MyPortfolioApp extends StatefulWidget {
  const MyPortfolioApp({super.key});


  @override
  State<MyPortfolioApp> createState() => _MyPortfolioAppState();
}

class _MyPortfolioAppState extends State<MyPortfolioApp> {
  @override
  Widget build(BuildContext context) {
    // Lock to portrait/landscape if needed
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pulkit Gahlot Portfolio',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.greenAccent,
        textTheme: TextTheme(
          titleMedium: GoogleFonts.courierPrime(color: Colors.greenAccent),
          headlineLarge: GoogleFonts.courierPrime(color: Colors.greenAccent),
          headlineMedium: GoogleFonts.courierPrime(color: Colors.greenAccent),
          bodyLarge: GoogleFonts.courierPrime(color: Colors.greenAccent),
          bodyMedium: GoogleFonts.courierPrime(color: Colors.greenAccent),
          bodySmall: GoogleFonts.courierPrime(color: Colors.greenAccent),
        ),
      ),
      home: HomeScreen(),
    );
  }
}