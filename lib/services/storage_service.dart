import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/meal.dart';

class StorageService {
  static const key = "meals";

  static Future<List<Meal>> loadMeals() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString(key);

      if (data == null) return [];

      return (jsonDecode(data) as List).map((e) => Meal.fromJson(e)).toList();
    } catch (_) {
      return [];
    }
  }

  static Future<void> saveMeals(List<Meal> meals) async {
    final prefs = await SharedPreferences.getInstance();

    final data = meals.map((e) => e.toJson()).toList();

    await prefs.setString(key, jsonEncode(data));
  }
}
