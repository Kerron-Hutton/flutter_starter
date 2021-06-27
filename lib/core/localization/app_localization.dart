import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const kSupportedLocales = <Locale>[
  Locale('en', 'US'),
  Locale('es', 'ES'),
];

class AppLocalizations {
  static const delegate = AppLocalizationsDelegate();
  final Locale locale;

  late Map<String, String> _localizedStrings;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Future<bool> load() async {
    final jsonString = await rootBundle.loadString(
      'assets/lang/${locale.languageCode}.json',
    );

    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  static String translate(BuildContext context, String key) {
    return AppLocalizations.of(context)!._translate(key);
  }

  String _translate(String key) {
    return _localizedStrings[key]!.trim();
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final index = kSupportedLocales.indexWhere(
      (element) => element.languageCode == locale.languageCode,
    );

    return index > -1;
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
