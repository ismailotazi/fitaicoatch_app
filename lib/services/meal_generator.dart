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
// class MealGenerator {
//   Map<String, Map<String, List<Map<String, String>>>> generateWeeklyMealPlan({
//     required String goal,
//     required String gender,
//   }) {
//     final Map<String, Map<String, List<Map<String, String>>>> weekPlan = {};

//     final days = [
//       'Monday',
//       'Tuesday',
//       'Wednesday',
//       'Thursday',
//       'Friday',
//       'Saturday',
//     ];

//     for (var day in days) {
//       weekPlan[day] = _getDailyMeals(goal, gender, day);
//     }

//     // Sunday = Cheat Meal
//     weekPlan['Sunday'] = {
//       'Breakfast': [
//         {'meal': 'pancakes_berries', 'cal': '600 kcal'},
//       ],
//       'Lunch': [
//         {'meal': 'burger_fries', 'cal': '900 kcal'},
//       ],
//       'Snack': [
//         {'meal': 'ice_cream', 'cal': '400 kcal'},
//       ],
//       'Dinner': [
//         {'meal': 'pizza_salad', 'cal': '800 kcal'},
//       ],
//     };

//     return weekPlan;
//   }

//   Map<String, List<Map<String, String>>> _getDailyMeals(
//     String goal,
//     String gender,
//     String day,
//   ) {
//     final isMale = gender.toLowerCase() == 'male';

//     switch (goal.toLowerCase()) {
//       case 'bulking':
//         final meals = {
//           'Monday': {
//             'Breakfast': [
//               {
//                 'meal': 'oatmeal_banana_pb',
//                 'cal': isMale ? '550 kcal' : '450 kcal',
//               },
//             ],
//             'Lunch': [
//               {'meal': 'chicken_rice', 'cal': isMale ? '750 kcal' : '600 kcal'},
//             ],
//             'Snack': [
//               {
//                 'meal': 'greek_yogurt_nuts',
//                 'cal': isMale ? '350 kcal' : '250 kcal',
//               },
//             ],
//             'Dinner': [
//               {
//                 'meal': 'salmon_sweet_potato',
//                 'cal': isMale ? '650 kcal' : '500 kcal',
//               },
//             ],
//           },

//           'Tuesday': {
//             'Breakfast': [
//               {'meal': 'eggs_toast', 'cal': isMale ? '500 kcal' : '400 kcal'},
//             ],
//             'Lunch': [
//               {'meal': 'beef_quinoa', 'cal': isMale ? '800 kcal' : '650 kcal'},
//             ],
//             'Snack': [
//               {
//                 'meal': 'protein_shake',
//                 'cal': isMale ? '300 kcal' : '200 kcal',
//               },
//             ],
//             'Dinner': [
//               {
//                 'meal': 'tuna_sweet_potato',
//                 'cal': isMale ? '600 kcal' : '450 kcal',
//               },
//             ],
//           },

//           'Wednesday': {
//             'Breakfast': [
//               {
//                 'meal': 'pancakes_berries',
//                 'cal': isMale ? '550 kcal' : '450 kcal',
//               },
//             ],
//             'Lunch': [
//               {'meal': 'chicken_rice', 'cal': isMale ? '700 kcal' : '550 kcal'},
//             ],
//             'Snack': [
//               {'meal': 'almonds', 'cal': isMale ? '300 kcal' : '200 kcal'},
//             ],
//             'Dinner': [
//               {
//                 'meal': 'salmon_sweet_potato',
//                 'cal': isMale ? '600 kcal' : '500 kcal',
//               },
//             ],
//           },

//           'Thursday': {
//             'Breakfast': [
//               {
//                 'meal': 'oatmeal_banana_pb',
//                 'cal': isMale ? '500 kcal' : '400 kcal',
//               },
//             ],
//             'Lunch': [
//               {'meal': 'chicken_rice', 'cal': isMale ? '750 kcal' : '600 kcal'},
//             ],
//             'Snack': [
//               {
//                 'meal': 'greek_yogurt_nuts',
//                 'cal': isMale ? '300 kcal' : '250 kcal',
//               },
//             ],
//             'Dinner': [
//               {'meal': 'chicken_rice', 'cal': isMale ? '650 kcal' : '500 kcal'},
//             ],
//           },

//           'Friday': {
//             'Breakfast': [
//               {'meal': 'eggs_toast', 'cal': isMale ? '500 kcal' : '400 kcal'},
//             ],
//             'Lunch': [
//               {'meal': 'beef_quinoa', 'cal': isMale ? '800 kcal' : '650 kcal'},
//             ],
//             'Snack': [
//               {
//                 'meal': 'protein_shake',
//                 'cal': isMale ? '300 kcal' : '200 kcal',
//               },
//             ],
//             'Dinner': [
//               {
//                 'meal': 'salmon_sweet_potato',
//                 'cal': isMale ? '600 kcal' : '500 kcal',
//               },
//             ],
//           },

//           'Saturday': {
//             'Breakfast': [
//               {
//                 'meal': 'oatmeal_banana_pb',
//                 'cal': isMale ? '550 kcal' : '450 kcal',
//               },
//             ],
//             'Lunch': [
//               {'meal': 'chicken_rice', 'cal': isMale ? '750 kcal' : '600 kcal'},
//             ],
//             'Snack': [
//               {
//                 'meal': 'greek_yogurt_nuts',
//                 'cal': isMale ? '350 kcal' : '250 kcal',
//               },
//             ],
//             'Dinner': [
//               {
//                 'meal': 'tuna_sweet_potato',
//                 'cal': isMale ? '600 kcal' : '500 kcal',
//               },
//             ],
//           },
//         };

//         return meals[day]!;

//       case 'cutting':
//         final meals = {
//           'Monday': {
//             'Breakfast': [
//               {
//                 'meal': 'oats_milk_fruits',
//                 'cal': isMale ? '350 kcal' : '250 kcal',
//               },
//             ],
//             'Lunch': [
//               {
//                 'meal': 'grilled_chicken_salad',
//                 'cal': isMale ? '450 kcal' : '350 kcal',
//               },
//             ],
//             'Snack': [
//               {'meal': 'almonds', 'cal': isMale ? '200 kcal' : '150 kcal'},
//             ],
//             'Dinner': [
//               {'meal': 'tuna_salad', 'cal': isMale ? '400 kcal' : '300 kcal'},
//             ],
//           },

//           'Tuesday': {
//             'Breakfast': [
//               {'meal': 'eggs_toast', 'cal': isMale ? '350 kcal' : '250 kcal'},
//             ],
//             'Lunch': [
//               {
//                 'meal': 'turkey_quinoa',
//                 'cal': isMale ? '450 kcal' : '350 kcal',
//               },
//             ],
//             'Snack': [
//               {
//                 'meal': 'protein_shake',
//                 'cal': isMale ? '200 kcal' : '150 kcal',
//               },
//             ],
//             'Dinner': [
//               {
//                 'meal': 'grilled_chicken_salad',
//                 'cal': isMale ? '400 kcal' : '300 kcal',
//               },
//             ],
//           },
//         };

//         return meals[day] ?? meals['Monday']!;

//       default: // Fitness
//         final meals = {
//           'Monday': {
//             'Breakfast': [
//               {
//                 'meal': 'oats_milk_fruits',
//                 'cal': isMale ? '400 kcal' : '300 kcal',
//               },
//             ],
//             'Lunch': [
//               {'meal': 'chicken_rice', 'cal': isMale ? '600 kcal' : '500 kcal'},
//             ],
//             'Snack': [
//               {
//                 'meal': 'yogurt_banana',
//                 'cal': isMale ? '250 kcal' : '200 kcal',
//               },
//             ],
//             'Dinner': [
//               {'meal': 'eggs_toast', 'cal': isMale ? '400 kcal' : '300 kcal'},
//             ],
//           },

//           'Tuesday': {
//             'Breakfast': [
//               {
//                 'meal': 'oats_milk_fruits',
//                 'cal': isMale ? '400 kcal' : '300 kcal',
//               },
//             ],
//             'Lunch': [
//               {
//                 'meal': 'turkey_quinoa',
//                 'cal': isMale ? '600 kcal' : '500 kcal',
//               },
//             ],
//             'Snack': [
//               {
//                 'meal': 'greek_yogurt_nuts',
//                 'cal': isMale ? '250 kcal' : '200 kcal',
//               },
//             ],
//             'Dinner': [
//               {
//                 'meal': 'salmon_sweet_potato',
//                 'cal': isMale ? '400 kcal' : '300 kcal',
//               },
//             ],
//           },
//         };

//         final safeMeals = meals[day];

//         if (safeMeals == null) {
//           return meals['Monday']!;
//         }

//         return safeMeals;
//     }
//   }
// }
