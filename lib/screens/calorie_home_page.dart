import 'package:fitaicoatch_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../models/meal.dart';
import '../services/storage_service.dart';
import '../services/calorie_service.dart';
import 'add_meal_page.dart';

class CalorieHomePage extends StatefulWidget {
  final int goalCalories;

  const CalorieHomePage({super.key, required this.goalCalories});

  @override
  State<CalorieHomePage> createState() => _CalorieHomePageState();
}

class _CalorieHomePageState extends State<CalorieHomePage> {
  List<Meal> meals = [];

  @override
  void initState() {
    super.initState();
    loadMeals();
  }

  Future<void> loadMeals() async {
    meals = await StorageService.loadMeals();
    setState(() {});
  }

  Future<void> saveMeals() async {
    await StorageService.saveMeals(meals);
  }

  int get todayCalories => CalorieService.todayCalories(meals);

  double get progress =>
      CalorieService.progress(todayCalories, widget.goalCalories);

  String statusText(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return todayCalories > widget.goalCalories ? t.exceeded : t.onTrack;
  }

  Color get statusColor =>
      todayCalories > widget.goalCalories ? Colors.red : Colors.green;

  final formatter = NumberFormat('#,###');

  Map<int, int> get weeklyData => CalorieService.weeklyCalories(meals);

  List<FlSpot> weeklySpots() {
    return List.generate(7, (i) {
      return FlSpot(i.toDouble(), (weeklyData[i] ?? 0).toDouble());
    });
  }

  double get maxY {
    final values = weeklyData.values.toList();
    if (values.isEmpty) return 1000;
    final max = values.reduce((a, b) => a > b ? a : b);
    return (max * 1.2).ceilToDouble();
  }

  void addMeal() async {
    final meal = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddMealPage()),
    );

    if (meal != null) {
      setState(() => meals.add(meal));
      saveMeals();
    }
  }

  void editMeal(int i) async {
    final updated = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddMealPage(existingMeal: meals[i])),
    );

    if (updated == null) return;

    setState(() => meals[i] = updated);
    saveMeals();
  }

  void deleteMeal(Meal meal) {
    setState(() => meals.remove(meal));
    saveMeals();
  }

  @override
  Widget build(BuildContext context) {
    final todayIndex = DateTime.now().weekday - 1;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    // 🎨 COLORS
    final primaryColor = const Color(0xFF2F5FD0);
    final bgColor = isDark ? const Color(0xFF0F0F10) : const Color(0xFFF2F2F2);
    final cardColor = isDark
        ? const Color(0xFF1A1A1D)
        : const Color(0xFFE6E0EC);
    final chartColor = const Color(0xFF1DB9C3);
    final textColor = isDark ? Colors.white : const Color(0xFF333333);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.calorieTracker,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: addMeal,
        backgroundColor: Theme.of(context).colorScheme.primary,
        icon: const Icon(Icons.local_fire_department),
        label: Text(
          AppLocalizations.of(context)!.addMeal,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        color: bgColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🔥 STATUS CARD
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(isDark ? 0.25 : 0.05),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "${formatter.format(todayCalories)} / ${formatter.format(widget.goalCalories)} ${AppLocalizations.of(context)!.kcal}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 10,
                        backgroundColor: isDark
                            ? Colors.grey.shade800
                            : Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation(statusColor),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      statusText(context),
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 📊 CHART
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(isDark ? 0.25 : 0.05),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 200,
                  child: LineChart(
                    LineChartData(
                      minY: 0,
                      maxY: maxY,
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              const days = [
                                'Mon',
                                'Tue',
                                'Wed',
                                'Thu',
                                'Fri',
                                'Sat',
                                'Sun',
                              ];

                              int i = value.toInt();

                              return Text(
                                days[i],
                                style: TextStyle(
                                  fontSize: 10,
                                  color: i == todayIndex
                                      ? statusColor // 🔥 dynamic color
                                      : textColor.withOpacity(0.6),
                                  fontWeight: i == todayIndex
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: weeklySpots(),
                          isCurved: true,
                          barWidth: 3,
                          color: chartColor,
                          dotData: FlDotData(
                            show: true,
                            getDotPainter: (spot, _, __, index) {
                              if (index == todayIndex) {
                                return FlDotCirclePainter(
                                  radius: 6,
                                  color: chartColor,
                                  strokeColor: Colors.white,
                                  strokeWidth: 2,
                                );
                              }
                              return FlDotCirclePainter(
                                radius: 3,
                                color: chartColor,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🍽 LIST
              Expanded(
                child: ListView.builder(
                  itemCount: meals.length,
                  itemBuilder: (_, i) {
                    final m = meals[i];

                    return Dismissible(
                      key: ValueKey(m.date.toIso8601String() + m.name),
                      onDismissed: (_) => deleteMeal(m),
                      child: Card(
                        color: cardColor,
                        child: ListTile(
                          leading: const Icon(
                            Icons.restaurant,
                            color: Color(0xFF6A4FB3),
                          ),
                          title: Text(
                            m.name,
                            style: TextStyle(color: textColor),
                          ),
                          subtitle: Text(
                            "${m.calories} kcal",
                            style: TextStyle(color: textColor.withOpacity(0.7)),
                          ),
                          onTap: () => editMeal(i),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
