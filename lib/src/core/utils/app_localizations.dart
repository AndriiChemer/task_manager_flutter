import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Iterable<Locale> supportedLocales = [
  Locale('en', 'US'),
];

class AppLocalizations {
  // final Locale locale;
  Map<String, String> _localizedStrings = {};
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  Future<AppLocalizations> load(Locale locale) async {
    String jsonString = await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
    return this;
  }

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)!;

  String translate(String key) => _localizedStrings[key] ?? "$key not fount!";
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => supportedLocales.contains(locale);

  @override
  Future<AppLocalizations> load(Locale locale) async =>
      await AppLocalizations().load(locale);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
