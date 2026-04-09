import 'package:flutter/material.dart';
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
    weeklyMeals = MealGenerator().generateWeeklyMealPlan(
      goal: widget.data['goal']!,
      gender: widget.data['gender']!,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meals = weeklyMeals[selectedDay]!;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          selectedDay == 'Sunday' ? "Cheat Meal 🍕" : "Meal Plan 🍽️",
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 🔥 Days Selector Horizontal
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
                            ? (day == 'Sunday'
                                  ? Colors.redAccent
                                  : Colors.green)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          if (isSelected)
                            BoxShadow(
                              color:
                                  (day == 'Sunday'
                                          ? Colors.redAccent
                                          : Colors.green)
                                      .withOpacity(0.3),
                              blurRadius: 10,
                            ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          day,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
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

            /// 🔹 Meals List
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
                          mealTime,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: mealTime == 'Dinner'
                                ? Colors.orange
                                : Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...meals[mealTime]!.map((meal) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  selectedDay == 'Sunday'
                                      ? Colors.red.shade50
                                      : Colors.green.shade50,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: const [
                                BoxShadow(color: Colors.black12, blurRadius: 4),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.restaurant,
                                  color: selectedDay == 'Sunday'
                                      ? Colors.redAccent
                                      : Colors.green,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        meal['meal']!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        meal['cal']!,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
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
