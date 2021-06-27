import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData get light => _light();

  static ThemeData get dark => _dark();

  static final TextTheme _textTheme = GoogleFonts.latoTextTheme();

  static ThemeData _light() {
    return ThemeData.light().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: _textTheme,
    );
  }

  static ThemeData _dark() {
    return ThemeData.dark().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: _textTheme.copyWith(
        headline3: _textTheme.headline3!.copyWith(color: Colors.white),
        headline4: _textTheme.headline4!.copyWith(color: Colors.white),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.amber,
      ),
    );
  }
}
