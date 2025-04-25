import 'package:flutter/material.dart';
import 'package:khalty_aicha/intro_screen.dart';
import 'package:khalty_aicha/recipe_detail_screen.dart';
import 'package:khalty_aicha/tunisian_cuisine_screen.dart';
import 'package:khalty_aicha/tunisian_pastry_screen.dart';

void main() {
  runApp (MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khalty Aîcha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFD4A056), // Couleur safran
        hintColor: Color(0xFF8A9B52), // Vert olive
        scaffoldBackgroundColor: Color(0xFFF5E6CA), // Beige clair
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B4226), // Marron café
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Color(0xFF4A2B0F), // Marron foncé
          ),
        ),
        fontFamily: 'Cairo',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => IntroScreen(),
        '/cuisine': (context) => TunisianCuisineScreen(),
        '/pastry': (context) => TunisianPastryScreen(),
        '/detail': (context) => RecipeDetailScreen(),
      },
    );
  }
}

