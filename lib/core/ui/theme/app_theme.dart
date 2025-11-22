import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _primaryBlue = Color(0xFF1B5C98);
  static const Color _secondaryPink = Color(0xFFEE7595);

  static const Color _lightBackground = Color(0xFFF8F9FA);
  static const Color _darkText = Color(0xFF212529);

  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _primaryBlue,
      background: _lightBackground,
      surface: Colors.white,
      onBackground: _darkText,
      secondary: _secondaryPink,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,

      scaffoldBackgroundColor: _lightBackground,

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: _darkText,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: _darkText,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      textTheme: TextTheme(
        headlineSmall: TextStyle(color: _darkText, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(color: _darkText, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: _darkText),
        bodyMedium: TextStyle(color: _darkText),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
    );
  }
}
