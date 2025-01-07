import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  static const _languageKey = 'language_code';
  final _prefs = SharedPreferences.getInstance();
  Locale? _selectedLocale;

  SettingsProvider() {
    _loadSettings();
  }

  Locale? get selectedLocale => _selectedLocale;

  Future<void> _loadSettings() async {
    final prefs = await _prefs;
    final languageCode = prefs.getString(_languageKey);
    if (languageCode != null) {
      _selectedLocale = Locale(languageCode);
      notifyListeners();
    }
  }

  Future<void> setLanguage(BuildContext context, Locale locale) async {
    final prefs = await _prefs;
    await prefs.setString(_languageKey, locale.languageCode);
    await context.setLocale(locale);
    _selectedLocale = locale;
    notifyListeners();
  }
}
