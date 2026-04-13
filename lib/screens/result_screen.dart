import 'package:fitaicoatch_app/screens/exercice_example_screen.dart';
import 'package:fitaicoatch_app/screens/meal_screen.dart';
import 'package:flutter/material.dart';
import '../services/program_generator.dart';
import 'package:fitaicoatch_app/l10n/app_localizations.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String selectedDay = '';
  Map<String, List<Map<String, String>>> program = {};

  String gender = '';
  String planType = 'Workout';

  bool isInit = false;

  String getGenderLabel(String gender, AppLocalizations t) {
    switch (gender) {
      case 'male':
        return t.male;
      case 'female':
        return t.female;
      default:
        return gender;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (isInit) return;
    isInit = true;

    final routeData = ModalRoute.of(context)?.settings.arguments;
    if (routeData == null) return;

    final data = routeData as Map<String, String>;
    final t = AppLocalizations.of(context)!;

    gender = (data['gender'] ?? 'male').toLowerCase();
    planType = data['planType'] ?? 'Workout';

    if (planType != 'Meal Plan') {
      program = ProgramGenerator().generateProgram(
        goal: data['goal'] ?? 'Fitness',
        weight: double.tryParse(data['weight'] ?? '') ?? 70,
        height: double.tryParse(data['height'] ?? '') ?? 170,
        gender: gender,
        t: t,
      );

      if (program.isNotEmpty) {
        selectedDay = program.keys.first;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>? ??
        {};

    gender = (data['gender'] ?? 'male').toLowerCase();
    planType = data['planType'] ?? 'Workout';

    /// =========================
    /// 🍽️ MEAL PLAN SCREEN
    /// =========================
    if (planType == 'Meal Plan') {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        // ❌ حيدنا AppBar من هنا فقط
        body: MealScreen(
          data: {'goal': data['goal'] ?? 'Fitness', 'gender': gender},
        ),
      );
    }

    /// =========================
    /// 🏋️ WORKOUT SCREEN
    /// =========================
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,

        foregroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,

        title: Text(
          t.workoutProgram,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Chip(
              label: Text(gender.toLowerCase() == 'male' ? t.male : t.female),
              backgroundColor: Theme.of(context).cardColor,
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (program.isNotEmpty)
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: program.keys.map((day) {
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
                        ),
                        child: Center(
                          child: Text(
                            day,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

            const SizedBox(height: 20),

            if (program.isNotEmpty && selectedDay.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  key: ValueKey(selectedDay),
                  itemCount: program[selectedDay]?.length ?? 0,
                  itemBuilder: (context, index) {
                    final exercise = program[selectedDay]![index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ExerciseExampleScreen(
                              exercise: {
                                'exercise': exercise['exercise'] ?? '',
                                'sets': exercise['sets'] ?? '',
                                'reps': exercise['reps'] ?? '',
                                'description': exercise['description'] ?? '',
                                'imageStart': exercise['imageStart'] ?? '',
                                'imageEnd': exercise['imageEnd'] ?? '',
                                'video': exercise['video'] ?? '',
                              },
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.fitness_center,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    exercise['exercise'] ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "${t.sets}: ${exercise['sets']} | ${t.reps}: ${exercise['reps']}",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

            if (program.isEmpty)
              Center(
                child: Text(
                  t.noWorkoutProgram,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
