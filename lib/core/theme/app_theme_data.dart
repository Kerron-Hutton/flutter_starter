import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

enum AppTheme { light, dark }

abstract class AppThemeData {
  static ThemeData of(AppTheme theme) {
    switch (theme) {
      case AppTheme.light:
        return _light();
      case AppTheme.dark:
        return _dark();
    }
  }

  static final TextTheme _textTheme = GoogleFonts.latoTextTheme();

  static ThemeData _light() {
    const appColor = AppColor(AppTheme.light);

    return ThemeData.light().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: appColor.primaryColor,
      textTheme: _textTheme,
    );
  }

  static ThemeData _dark() {
    const appColor = AppColor(AppTheme.dark);

    return ThemeData.dark().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: appColor.primaryColor,
      textTheme: _textTheme.copyWith(
        displaySmall: _textTheme.displaySmall!.copyWith(color: Colors.white),
        headlineMedium: _textTheme.headlineMedium!.copyWith(
          color: Colors.white,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.amber,
      ),
    );
  }
}
