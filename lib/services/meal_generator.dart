class MealGenerator {
  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  Map<String, Map<String, List<Map<String, String>>>> generateWeeklyMealPlan({
    required String goal,
    required String gender,
  }) {
    final Map<String, Map<String, List<Map<String, String>>>> weekPlan = {};

    final g = gender.toLowerCase();
    final goalType = goal.toLowerCase();

    for (int i = 0; i < days.length; i++) {
      final day = days[i];
      weekPlan[day] = _getPlan(day, i, g, goalType);
    }

    // 🍕 Sunday Cheat Meal
    weekPlan['Sunday'] = {
      'Breakfast': [
        {'meal': 'pancakes_berries', 'cal': '600 kcal'},
      ],
      'Lunch': [
        {'meal': 'burger_fries', 'cal': '900 kcal'},
      ],
      'Snack': [
        {'meal': 'ice_cream', 'cal': '400 kcal'},
      ],
      'Dinner': [
        {'meal': 'pizza_salad', 'cal': '800 kcal'},
      ],
    };

    return weekPlan;
  }

  Map<String, List<Map<String, String>>> _getPlan(
    String day,
    int i,
    String gender,
    String goal,
  ) {
    final isMale = gender == 'male';

    switch (goal) {
      // ================= BULKING =================
      case 'bulking':
        return {
          'Breakfast': [
            {
              'meal': _bulkingBreakfast[i % _bulkingBreakfast.length],
              'cal': isMale ? '550 kcal' : '450 kcal',
            },
          ],
          'Lunch': [
            {
              'meal': _bulkingLunch[i % _bulkingLunch.length],
              'cal': isMale ? '750 kcal' : '600 kcal',
            },
          ],
          'Snack': [
            {
              'meal': _bulkingSnack[i % _bulkingSnack.length],
              'cal': isMale ? '350 kcal' : '250 kcal',
            },
          ],
          'Dinner': [
            {
              'meal': _bulkingDinner[i % _bulkingDinner.length],
              'cal': isMale ? '650 kcal' : '500 kcal',
            },
          ],
        };

      // ================= CUTTING =================
      case 'cutting':
        return {
          'Breakfast': [
            {
              'meal': _cuttingBreakfast[i % _cuttingBreakfast.length],
              'cal': isMale ? '350 kcal' : '250 kcal',
            },
          ],
          'Lunch': [
            {
              'meal': _cuttingLunch[i % _cuttingLunch.length],
              'cal': isMale ? '450 kcal' : '350 kcal',
            },
          ],
          'Snack': [
            {
              'meal': _cuttingSnack[i % _cuttingSnack.length],
              'cal': isMale ? '200 kcal' : '150 kcal',
            },
          ],
          'Dinner': [
            {
              'meal': _cuttingDinner[i % _cuttingDinner.length],
              'cal': isMale ? '400 kcal' : '300 kcal',
            },
          ],
        };

      // ================= FITNESS =================
      default:
        return {
          'Breakfast': [
            {
              'meal': _fitnessBreakfast[i % _fitnessBreakfast.length],
              'cal': isMale ? '400 kcal' : '300 kcal',
            },
          ],
          'Lunch': [
            {
              'meal': _fitnessLunch[i % _fitnessLunch.length],
              'cal': isMale ? '600 kcal' : '500 kcal',
            },
          ],
          'Snack': [
            {
              'meal': _fitnessSnack[i % _fitnessSnack.length],
              'cal': isMale ? '250 kcal' : '200 kcal',
            },
          ],
          'Dinner': [
            {
              'meal': _fitnessDinner[i % _fitnessDinner.length],
              'cal': isMale ? '400 kcal' : '300 kcal',
            },
          ],
        };
    }
  }

  // ================= BULKING LISTS =================
  final _bulkingBreakfast = [
    'oatmeal_banana_pb',
    'eggs_toast',
    'pancakes_berries',
  ];

  final _bulkingLunch = ['chicken_rice', 'beef_quinoa', 'turkey_quinoa'];

  final _bulkingSnack = ['greek_yogurt_nuts', 'protein_shake', 'almonds'];

  final _bulkingDinner = [
    'salmon_sweet_potato',
    'tuna_sweet_potato',
    'chicken_rice',
  ];

  // ================= CUTTING LISTS =================
  final _cuttingBreakfast = ['oats_milk_fruits', 'eggs_toast'];

  final _cuttingLunch = ['grilled_chicken_salad', 'turkey_quinoa'];

  final _cuttingSnack = ['almonds', 'protein_shake'];

  final _cuttingDinner = ['tuna_salad', 'grilled_chicken_salad'];

  // ================= FITNESS LISTS =================
  final _fitnessBreakfast = ['oats_milk_fruits', 'eggs_toast'];

  final _fitnessLunch = ['chicken_rice', 'turkey_quinoa'];

  final _fitnessSnack = ['yogurt_banana', 'greek_yogurt_nuts'];

  final _fitnessDinner = ['eggs_toast', 'salmon_sweet_potato'];
}
