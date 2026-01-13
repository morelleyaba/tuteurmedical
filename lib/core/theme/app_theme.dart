import 'package:flutter/material.dart';

/// Application theme configuration
class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        fontSize: 16,
      ),
      labelMedium: TextStyle(fontSize: 14),
      labelSmall: TextStyle(fontSize: 12),
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.grey, // gris moyen
          width: 0.6, // fin mais visible
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.grey, // gris moyen
          width: 0.6, // fin mais visible
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.grey, // gris moyen
          width: 0.6, // fin mais visible
        ),
      ),
      labelStyle: const TextStyle(fontSize: 14),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    useMaterial3: true,
    fontFamily: 'Roboto',
  );
}
