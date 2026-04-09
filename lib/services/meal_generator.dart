class MealGenerator {
  Map<String, Map<String, List<Map<String, String>>>> generateWeeklyMealPlan({
    required String goal,
    required String gender,
  }) {
    final Map<String, Map<String, List<Map<String, String>>>> weekPlan = {};

    final days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];

    for (var day in days) {
      weekPlan[day] = _getDailyMeals(goal, gender, day);
    }

    // Sunday = Cheat Meal
    weekPlan['Sunday'] = {
      'Breakfast': [
        {'meal': 'Pancakes + Maple Syrup + Berries', 'cal': '600 kcal'},
      ],
      'Lunch': [
        {'meal': 'Burger + Fries', 'cal': '900 kcal'},
      ],
      'Snack': [
        {'meal': 'Ice Cream', 'cal': '400 kcal'},
      ],
      'Dinner': [
        {'meal': 'Pizza + Salad', 'cal': '800 kcal'},
      ],
    };

    return weekPlan;
  }

  // ✅ Daily meals generator with variation by day & gender
  Map<String, List<Map<String, String>>> _getDailyMeals(
    String goal,
    String gender,
    String day,
  ) {
    final isMale = gender.toLowerCase() == 'male';

    switch (goal) {
      case 'Bulking':
        // Different meals by day
        final meals = {
          'Monday': {
            'Breakfast': [
              {
                'meal': 'Oatmeal + Banana + Peanut Butter',
                'cal': isMale ? '550 kcal' : '450 kcal',
              },
            ],
            'Lunch': [
              {
                'meal': 'Chicken Breast + Rice + Veggies',
                'cal': isMale ? '750 kcal' : '600 kcal',
              },
            ],
            'Snack': [
              {
                'meal': 'Greek Yogurt + Nuts',
                'cal': isMale ? '350 kcal' : '250 kcal',
              },
            ],
            'Dinner': [
              {
                'meal': 'Salmon + Sweet Potato',
                'cal': isMale ? '650 kcal' : '500 kcal',
              },
            ],
          },
          'Tuesday': {
            'Breakfast': [
              {
                'meal': 'Eggs (4) + Toast',
                'cal': isMale ? '500 kcal' : '400 kcal',
              },
            ],
            'Lunch': [
              {
                'meal': 'Beef + Quinoa + Veggies',
                'cal': isMale ? '800 kcal' : '650 kcal',
              },
            ],
            'Snack': [
              {
                'meal': 'Protein Shake',
                'cal': isMale ? '300 kcal' : '200 kcal',
              },
            ],
            'Dinner': [
              {
                'meal': 'Tuna + Sweet Potato',
                'cal': isMale ? '600 kcal' : '450 kcal',
              },
            ],
          },
          'Wednesday': {
            'Breakfast': [
              {
                'meal': 'Pancakes + Peanut Butter',
                'cal': isMale ? '550 kcal' : '450 kcal',
              },
            ],
            'Lunch': [
              {
                'meal': 'Chicken + Brown Rice + Veggies',
                'cal': isMale ? '700 kcal' : '550 kcal',
              },
            ],
            'Snack': [
              {'meal': 'Nuts + Fruit', 'cal': isMale ? '300 kcal' : '200 kcal'},
            ],
            'Dinner': [
              {
                'meal': 'Salmon + Broccoli',
                'cal': isMale ? '600 kcal' : '500 kcal',
              },
            ],
          },
          'Thursday': {
            'Breakfast': [
              {
                'meal': 'Oatmeal + Berries',
                'cal': isMale ? '500 kcal' : '400 kcal',
              },
            ],
            'Lunch': [
              {
                'meal': 'Turkey + Rice + Veggies',
                'cal': isMale ? '750 kcal' : '600 kcal',
              },
            ],
            'Snack': [
              {
                'meal': 'Greek Yogurt + Honey',
                'cal': isMale ? '300 kcal' : '250 kcal',
              },
            ],
            'Dinner': [
              {
                'meal': 'Chicken + Sweet Potato',
                'cal': isMale ? '650 kcal' : '500 kcal',
              },
            ],
          },
          'Friday': {
            'Breakfast': [
              {
                'meal': 'Egg Omelette + Toast',
                'cal': isMale ? '500 kcal' : '400 kcal',
              },
            ],
            'Lunch': [
              {
                'meal': 'Beef + Rice + Veggies',
                'cal': isMale ? '800 kcal' : '650 kcal',
              },
            ],
            'Snack': [
              {
                'meal': 'Protein Shake',
                'cal': isMale ? '300 kcal' : '200 kcal',
              },
            ],
            'Dinner': [
              {
                'meal': 'Salmon + Broccoli',
                'cal': isMale ? '600 kcal' : '500 kcal',
              },
            ],
          },
          'Saturday': {
            'Breakfast': [
              {
                'meal': 'Oatmeal + Peanut Butter',
                'cal': isMale ? '550 kcal' : '450 kcal',
              },
            ],
            'Lunch': [
              {
                'meal': 'Chicken + Quinoa + Veggies',
                'cal': isMale ? '750 kcal' : '600 kcal',
              },
            ],
            'Snack': [
              {
                'meal': 'Nuts + Yogurt',
                'cal': isMale ? '350 kcal' : '250 kcal',
              },
            ],
            'Dinner': [
              {
                'meal': 'Tuna + Sweet Potato',
                'cal': isMale ? '600 kcal' : '500 kcal',
              },
            ],
          },
        };
        return meals[day]!;
      case 'Cutting':
        // Similar pattern for Cutting goal
        final meals = {
          'Monday': {
            'Breakfast': [
              {'meal': 'Oats + Apple', 'cal': isMale ? '350 kcal' : '250 kcal'},
            ],
            'Lunch': [
              {
                'meal': 'Grilled Chicken + Salad',
                'cal': isMale ? '450 kcal' : '350 kcal',
              },
            ],
            'Snack': [
              {'meal': 'Almonds', 'cal': isMale ? '200 kcal' : '150 kcal'},
            ],
            'Dinner': [
              {'meal': 'Tuna Salad', 'cal': isMale ? '400 kcal' : '300 kcal'},
            ],
          },
          // Add Tuesday → Saturday with different meals
          'Tuesday': {
            'Breakfast': [
              {
                'meal': 'Eggs + Spinach',
                'cal': isMale ? '350 kcal' : '250 kcal',
              },
            ],
            'Lunch': [
              {
                'meal': 'Turkey + Veggies',
                'cal': isMale ? '450 kcal' : '350 kcal',
              },
            ],
            'Snack': [
              {
                'meal': 'Protein Shake',
                'cal': isMale ? '200 kcal' : '150 kcal',
              },
            ],
            'Dinner': [
              {
                'meal': 'Grilled Salmon + Salad',
                'cal': isMale ? '400 kcal' : '300 kcal',
              },
            ],
          },
          // Wednesday → Saturday similar, you can add variations
        };
        return meals[day]!;
      default: // Fitness
        final meals = {
          'Monday': {
            'Breakfast': [
              {
                'meal': 'Oats + Milk + Fruits',
                'cal': isMale ? '400 kcal' : '300 kcal',
              },
            ],
            'Lunch': [
              {
                'meal': 'Chicken + Rice + Veggies',
                'cal': isMale ? '600 kcal' : '500 kcal',
              },
            ],
            'Snack': [
              {
                'meal': 'Yogurt + Banana',
                'cal': isMale ? '250 kcal' : '200 kcal',
              },
            ],
            'Dinner': [
              {'meal': 'Eggs + Salad', 'cal': isMale ? '400 kcal' : '300 kcal'},
            ],
          },
          'Tuesday': {
            'Breakfast': [
              {
                'meal': 'Oats + Berries + Milk',
                'cal': isMale ? '400 kcal' : '300 kcal',
              },
            ],
            'Lunch': [
              {
                'meal': 'Turkey + Quinoa + Veggies',
                'cal': isMale ? '600 kcal' : '500 kcal',
              },
            ],
            'Snack': [
              {
                'meal': 'Nuts + Yogurt',
                'cal': isMale ? '250 kcal' : '200 kcal',
              },
            ],
            'Dinner': [
              {
                'meal': 'Salmon + Broccoli',
                'cal': isMale ? '400 kcal' : '300 kcal',
              },
            ],
          },
          // Wednesday → Saturday similar, you can add variations
        };
        return meals[day]!;
    }
  }
}
