import 'package:flutter/material.dart';
import 'package:fitaicoatch_app/l10n/app_localizations.dart';
import 'package:fitaicoatch_app/screens/calorie_home_page.dart';
import '../services/meal_generator.dart';

class MealScreen extends StatefulWidget {
  final Map<String, String> data;
  const MealScreen({super.key, required this.data});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  String selectedDay = 'Monday';
  Map<String, Map<String, List<Map<String, String>>>> weeklyMeals = {};

  @override
  void initState() {
    super.initState();

    final goal = widget.data['goal'] ?? 'Fitness';
    final gender = (widget.data['gender'] ?? 'Male').toLowerCase();

    weeklyMeals = MealGenerator().generateWeeklyMealPlan(
      goal: goal,
      gender: gender,
    );
  }

  String tKey(String key, AppLocalizations t) {
    switch (key) {
      case 'Monday':
        return t.monday;
      case 'Tuesday':
        return t.tuesday;
      case 'Wednesday':
        return t.wednesday;
      case 'Thursday':
        return t.thursday;
      case 'Friday':
        return t.friday;
      case 'Saturday':
        return t.saturday;
      case 'Sunday':
        return t.sunday;

      case 'Breakfast':
        return t.breakfast;
      case 'Lunch':
        return t.lunch;
      case 'Snack':
        return t.snack;
      case 'Dinner':
        return t.dinner;

      case 'Meal Plan 🍽️':
        return t.mealPlan;

      case 'Cheat Meal 🍕':
        return t.cheatMeal;

      case 'chicken_rice':
        return t.chickenRice;
      case 'oatmeal_banana_pb':
        return t.oatmealBananaPb;
      case 'salmon_sweet_potato':
        return t.salmonSweetPotato;
      case 'eggs_toast':
        return t.eggsToast;
      case 'beef_quinoa':
        return t.beefQuinoa;
      case 'protein_shake':
        return t.proteinShake;
      case 'tuna_sweet_potato':
        return t.tunaSweetPotato;
      case 'greek_yogurt_nuts':
        return t.greekYogurtNuts;
      case 'almonds':
        return t.almonds;
      case 'turkey_quinoa':
        return t.turkeyQuinoa;
      case 'grilled_chicken_salad':
        return t.grilledChickenSalad;
      case 'tuna_salad':
        return t.tunaSalad;
      case 'yogurt_banana':
        return t.yogurtBanana;

      case 'pancakes_berries':
        return t.pancakesBerries;
      case 'burger_fries':
        return t.burgerFries;
      case 'ice_cream':
        return t.iceCream;
      case 'pizza_salad':
        return t.pizzaSalad;
      case 'oats_milk_fruits':
        return t.oatsMilkFruits;

      default:
        return key;
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final meals = weeklyMeals[selectedDay] ?? {};

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      // 🔥 APP BAR UPDATED (ONLY ADDITION)
      appBar: AppBar(
        title: Text(
          selectedDay == 'Sunday'
              ? AppLocalizations.of(context)!.cheatMeal
              : AppLocalizations.of(context)!.mealPlan,
        ),

        actions: [
          // 🔥 CALORIE ICON BUTTON
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: const Icon(
                Icons.local_fire_department,
                color: Colors.orange,
                size: 28,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CalorieHomePage(goalCalories: 2000),
                  ),
                );
              },
            ),
          ),

          // 👤 GENDER CHIP (UNCHANGED)
          Padding(
            padding: const EdgeInsets.all(12),
            child: Chip(
              label: Text(
                widget.data['gender'] == 'female'
                    ? AppLocalizations.of(context)!.female
                    : AppLocalizations.of(context)!.male,
              ),
              backgroundColor: Theme.of(context).cardColor,
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: weeklyMeals.keys.map((day) {
                  final isSelected = day == selectedDay;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDay = day;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          if (isSelected)
                            BoxShadow(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withOpacity(0.25),
                              blurRadius: 10,
                            ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          tKey(day, t),
                          style: TextStyle(
                            color: isSelected
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).textTheme.bodyMedium?.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (child, animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                child: ListView(
                  key: ValueKey(selectedDay),
                  children: meals.keys.map((mealTime) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tKey(mealTime, t),
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 10),

                        ...(meals[mealTime] ?? []).map((meal) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.restaurant,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        tKey(meal['meal']!, t),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        meal['cal']!,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),

                        const SizedBox(height: 20),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
