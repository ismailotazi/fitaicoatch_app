import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class AppSettings {
  static const _keyLanguage = 'language';
  static const _keyTheme = 'theme';

  /// 🌍 Save Language
  static Future<void> setLanguage(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLanguage, langCode);
  }

  static Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyLanguage) ?? 'en';
  }

  /// 🌙 Save Theme
  static Future<void> setThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyTheme, mode.name);
  }

  static Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_keyTheme);

    if (value == 'dark') return ThemeMode.dark;
    return ThemeMode.light;
  }
}
