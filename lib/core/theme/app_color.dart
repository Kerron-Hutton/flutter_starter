import 'package:flutter/material.dart';

import 'app_theme_data.dart';

class AppColor {
  static const _primaryColor = Color(0xFF4A4A58);

  final AppTheme theme;

  const AppColor(this.theme);

  Color get primaryColor => _isLight ? Colors.white : _primaryColor;

  bool get _isLight => theme == AppTheme.light;
}
