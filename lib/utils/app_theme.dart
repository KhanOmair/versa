import 'package:flutter/material.dart';

class AppTheme {
  // Define the primary color palette
  static const Color primaryDark =
      Color(0xFF252525); // Deep black for strong contrast
  static const Color primaryLight =
      Color(0xFFFFFFFF); // Pure white for clean backgrounds
  static const Color accent =
      Color(0xFFFA5F1A); // Vibrant orange for attention-grabbing elements
  static const Color sectionBg =
      Color(0xFFF7F0F0); // Soft neutral for subtle contrast

  // Typography colors
  static const Color textDark =
      primaryDark; // Default text on light backgrounds
  static const Color textLight = primaryLight; // Text on dark backgrounds

  // Button styles
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: accent,
    foregroundColor: textLight,
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    elevation: 2.0, // Minimal elevation for modern look
  );

  // Input decoration for forms
  static final InputDecoration inputDecoration = InputDecoration(
    filled: true,
    fillColor: primaryLight,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: sectionBg, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: accent, width: 2.0),
    ),
    hintStyle: TextStyle(color: textDark.withOpacity(0.5)),
  );

  // Text themes for consistency
  static final TextTheme textTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: textDark,
    ),
    headline2: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w600,
      color: textDark,
    ),
    bodyText1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: textDark,
    ),
    bodyText2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: textDark,
    ),
  );

  // Card styles
  static final BoxDecoration cardDecoration = BoxDecoration(
    color: primaryLight,
    borderRadius: BorderRadius.circular(12.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10.0,
        spreadRadius: 2.0,
        offset: const Offset(0, 4),
      ),
    ],
  );

  // Gradient background for hero sections
  static final BoxDecoration gradientBackground = BoxDecoration(
    gradient: LinearGradient(
      colors: [primaryDark, primaryDark.withOpacity(0.8)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );

  // Theme data for MaterialApp
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: primaryLight,
    primaryColor: accent,
    textTheme: textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButtonStyle),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: primaryLight,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: sectionBg, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: accent, width: 2.0),
      ),
    ),
  );
}
