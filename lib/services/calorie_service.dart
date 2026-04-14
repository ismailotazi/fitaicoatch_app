import '../models/meal.dart';

class CalorieService {
  static int todayCalories(List<Meal> meals) {
    final now = DateTime.now();

    return meals
        .where(
          (m) =>
              m.date.year == now.year &&
              m.date.month == now.month &&
              m.date.day == now.day,
        )
        .fold(0, (a, b) => a + b.calories);
  }

  static double progress(int c, int g) {
    if (g == 0) return 0;
    return (c / g).clamp(0.0, 1.0);
  }

  static Map<int, int> weeklyCalories(List<Meal> meals) {
    final now = DateTime.now();

    Map<int, int> data = {0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0};

    for (var m in meals) {
      final diff = now
          .difference(DateTime(m.date.year, m.date.month, m.date.day))
          .inDays;

      if (diff >= 0 && diff < 7) {
        final index = DateTime.now().subtract(Duration(days: diff)).weekday - 1;

        data[index] = (data[index] ?? 0) + m.calories;
      }
    }

    return data;
  }
}
