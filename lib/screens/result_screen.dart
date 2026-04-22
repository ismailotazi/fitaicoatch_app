import 'package:fitaicoatch_app/screens/exercice_example_screen.dart';
import 'package:fitaicoatch_app/screens/meal_screen.dart';
import 'package:flutter/material.dart';
import '../services/program_generator.dart';
import 'package:fitaicoatch_app/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  /// ✅ تخزين الأيام اللي تسالاو
  Set<String> finishedDays = {};

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

  //locked days
  Future<bool> isUnlocked(int day) async {
    final prefs = await SharedPreferences.getInstance();
    final done = prefs.getStringList('finished_days') ?? [];

    if (day == 1) return true;

    final keys = program.keys.toList();
    return done.contains(keys[day - 2]);
  }

  // reset
  Future<void> resetProgram() async {
    final prefs = await SharedPreferences.getInstance();

    // ❌ clear finished days
    await prefs.remove('finished_days');

    // ❌ remove ALL day unlock flags
    final keys = program.keys.toList();
    for (int i = 1; i <= keys.length; i++) {
      await prefs.remove("day_$i");
    }

    // ✅ force only day 1 unlocked
    if (keys.isNotEmpty) {
      await prefs.setBool("day_1", true);
    }

    setState(() {
      finishedDays.clear();
      selectedDay = keys.isNotEmpty ? keys.first : '';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.blueGrey.shade900,
        duration: const Duration(seconds: 3),
        content: Row(
          children: [
            const Icon(Icons.refresh_rounded, color: Colors.lightBlueAccent),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.programReset,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // motivatin essages
  String getMessage(AppLocalizations t) {
    int hour = DateTime.now().hour;

    if (hour < 12) return t.startStrong;
    if (hour < 18) return t.keepGoing;
    return t.finishStrong;
  }

  /// ✅ Progress (ratio)
  Future<double> getProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final days = prefs.getStringList('finished_days') ?? [];

    if (program.isEmpty) return 0;
    return days.length / program.length;
  }

  /// ✅ Streak (بسيطة: عدد الأيام المكتملة)
  Future<int> getStreak() async {
    final prefs = await SharedPreferences.getInstance();
    final days = prefs.getStringList('finished_days') ?? [];
    return days.length;
  }

  /// ✅ load من SharedPreferences
  Future<void> loadFinishedDays() async {
    final prefs = await SharedPreferences.getInstance();
    final days = prefs.getStringList('finished_days') ?? [];
    setState(() {
      finishedDays = days.toSet();
    });
  }

  // rate option
  Future<void> checkForRatingPrompt() async {
    final prefs = await SharedPreferences.getInstance();

    final finishedDays = prefs.getStringList('finished_days') ?? [];
    final hasRated = prefs.getBool('has_rated') ?? false;
    final lastPrompt = prefs.getInt('last_rate_prompt') ?? 0;

    // ⛔ user راه دار rate
    if (hasRated) return;

    // ⛔ خاصو يدوز على الأقل 2 أيام
    if (finishedDays.length < 2) return;

    final now = DateTime.now().millisecondsSinceEpoch;

    // ⛔ cooldown (2 days)
    const cooldown = 2 * 24 * 60 * 60 * 1000;
    if (now - lastPrompt < cooldown) return;

    // ✅ delay صغير باش متبانش مباشرة
    Future.delayed(const Duration(milliseconds: 600), () {
      showRateDialog();
    });

    // 💾 save last prompt time
    await prefs.setInt('last_rate_prompt', now);
  }

  // show rate dialog
  void showRateDialog() {
    final t = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            t.rateUs,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(t.rateMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(t.later),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('has_rated', true);

                Navigator.pop(context);

                // هنا تقدر تحل Play Store
              },
              child: Text(t.rateNow),
            ),
          ],
        );
      },
    );
  }

  /// ✅ save
  Future<void> finishDay(String day) async {
    final prefs = await SharedPreferences.getInstance();

    finishedDays.add(day);
    await prefs.setStringList('finished_days', finishedDays.toList());

    /// 🔓 unlock next day (FIX مهم)
    final keys = program.keys.toList();
    final index = keys.indexOf(day);

    if (index != -1 && index + 1 < keys.length) {
      await prefs.setBool("day_${index + 2}", true); // 👈 تصحيح
    }

    setState(() {});

    /// 🍽️ SnackBar احترافي
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.black.withOpacity(0.85),
        duration: const Duration(seconds: 3),
        content: Row(
          children: [
            const Icon(Icons.restaurant_menu, color: Colors.orange),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.dontForgetMeal,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    /// ⭐ Rating (بعد delay صغير وبـ safe check)
    Future.delayed(const Duration(milliseconds: 600), () async {
      if (!mounted) return;
      await checkForRatingPrompt();
    });
  }

  /// ✅ جديد: حساب الأيام المكتملة
  Future<int> getCompletedDays() async {
    final prefs = await SharedPreferences.getInstance();
    final days = prefs.getStringList('finished_days') ?? [];
    return days.length;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (isInit) return;
    isInit = true;

    loadFinishedDays();

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

    /// 🍽️ MEAL PLAN
    if (planType == 'Meal Plan') {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: MealScreen(
          data: {'goal': data['goal'] ?? 'Fitness', 'gender': gender},
        ),
      );
    }

    /// 🏋️ WORKOUT
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
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Chip(
              label: Text(gender == 'male' ? t.male : t.female),
              backgroundColor: Theme.of(context).cardColor,
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                getMessage(t),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            /// ✅ Progress Bar
            FutureBuilder(
              future: getProgress(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const SizedBox();

                return Column(
                  children: [
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: snapshot.data!),
                      duration: const Duration(milliseconds: 800),
                      builder: (context, value, _) {
                        return LinearProgressIndicator(
                          value: value,
                          minHeight: 8,
                          borderRadius: BorderRadius.circular(10),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),

            /// ✅ Streak 🔥
            FutureBuilder(
              future: getStreak(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const SizedBox();

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Builder(
                    builder: (context) {
                      final t = AppLocalizations.of(context)!;

                      return Text(
                        "🔥 ${t.streak}: ${snapshot.data}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
                );
              },
            ),

            /// ✅ Progress
            if (program.isNotEmpty)
              FutureBuilder(
                future: getCompletedDays(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const SizedBox();

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "${snapshot.data} / ${program.length} ${t.daysCompleted}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),

            /// ✅ Days
            if (program.isNotEmpty)
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: program.keys.toList().asMap().entries.map((entry) {
                    final index = entry.key; // 👈 هذا هو dayIndex الصحيح
                    final day = entry.value;

                    final isSelected = day == selectedDay;
                    final isFinished = finishedDays.contains(day);

                    return FutureBuilder<bool>(
                      future: isUnlocked(index + 1), // 👈 هنا التصحيح
                      builder: (context, snapshot) {
                        final unlocked = snapshot.data ?? false;

                        return GestureDetector(
                          onTap: unlocked
                              ? () {
                                  setState(() {
                                    selectedDay = day;
                                  });
                                }
                              : null,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: !unlocked
                                  ? Colors.grey
                                  : isFinished
                                  ? Colors.green
                                  : isSelected
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                if (!unlocked) const Icon(Icons.lock, size: 14),
                                if (!unlocked) const SizedBox(width: 5),
                                Text(day),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),

            const SizedBox(height: 20),

            /// ✅ Exercises
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

            /// ✅ Button
            if (program.isNotEmpty && selectedDay.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      finishDay(selectedDay);
                    },
                    child: Text(t.finishDay),
                  ),
                ),
              ),

            if (program.isEmpty)
              Center(
                child: Text(
                  t.noWorkoutProgram,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 1, bottom: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: resetProgram,
                  child: Text(
                    AppLocalizations.of(context)!.programReset,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:fitaicoatch_app/screens/exercice_example_screen.dart';
// import 'package:fitaicoatch_app/screens/meal_screen.dart';
// import 'package:flutter/material.dart';
// import '../services/program_generator.dart';
// import 'package:fitaicoatch_app/l10n/app_localizations.dart';

// class ResultScreen extends StatefulWidget {
//   const ResultScreen({super.key});

//   @override
//   State<ResultScreen> createState() => _ResultScreenState();
// }

// class _ResultScreenState extends State<ResultScreen> {
//   String selectedDay = '';
//   Map<String, List<Map<String, String>>> program = {};

//   String gender = '';
//   String planType = 'Workout';

//   bool isInit = false;

//   String getGenderLabel(String gender, AppLocalizations t) {
//     switch (gender) {
//       case 'male':
//         return t.male;
//       case 'female':
//         return t.female;
//       default:
//         return gender;
//     }
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();

//     if (isInit) return;
//     isInit = true;

//     final routeData = ModalRoute.of(context)?.settings.arguments;
//     if (routeData == null) return;

//     final data = routeData as Map<String, String>;
//     final t = AppLocalizations.of(context)!;

//     gender = (data['gender'] ?? 'male').toLowerCase();
//     planType = data['planType'] ?? 'Workout';

//     if (planType != 'Meal Plan') {
//       program = ProgramGenerator().generateProgram(
//         goal: data['goal'] ?? 'Fitness',
//         weight: double.tryParse(data['weight'] ?? '') ?? 70,
//         height: double.tryParse(data['height'] ?? '') ?? 170,
//         gender: gender,
//         t: t,
//       );

//       if (program.isNotEmpty) {
//         selectedDay = program.keys.first;
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final t = AppLocalizations.of(context)!;

//     final data =
//         ModalRoute.of(context)?.settings.arguments as Map<String, String>? ??
//         {};

//     gender = (data['gender'] ?? 'male').toLowerCase();
//     planType = data['planType'] ?? 'Workout';

//     /// =========================
//     /// 🍽️ MEAL PLAN SCREEN
//     /// =========================
//     if (planType == 'Meal Plan') {
//       return Scaffold(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,

//         // ❌ حيدنا AppBar من هنا فقط
//         body: MealScreen(
//           data: {'goal': data['goal'] ?? 'Fitness', 'gender': gender},
//         ),
//       );
//     }

//     /// =========================
//     /// 🏋️ WORKOUT SCREEN
//     /// =========================
//     return Scaffold(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,

//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,

//         foregroundColor: Theme.of(context).brightness == Brightness.dark
//             ? Colors.white
//             : Colors.black,

//         title: Text(
//           t.workoutProgram,
//           style: Theme.of(
//             context,
//           ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
//         ),

//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Chip(
//               label: Text(gender.toLowerCase() == 'male' ? t.male : t.female),
//               backgroundColor: Theme.of(context).cardColor,
//             ),
//           ),
//         ],
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             if (program.isNotEmpty)
//               SizedBox(
//                 height: 60,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: program.keys.map((day) {
//                     final isSelected = day == selectedDay;

//                     return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedDay = day;
//                         });
//                       },
//                       child: AnimatedContainer(
//                         duration: const Duration(milliseconds: 300),
//                         margin: const EdgeInsets.only(right: 10),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 20,
//                           vertical: 12,
//                         ),
//                         decoration: BoxDecoration(
//                           color: isSelected
//                               ? Theme.of(context).colorScheme.primary
//                               : Theme.of(context).cardColor,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Center(
//                           child: Text(
//                             day,
//                             style: Theme.of(context).textTheme.bodyMedium,
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),

//             const SizedBox(height: 20),

//             if (program.isNotEmpty && selectedDay.isNotEmpty)
//               Expanded(
//                 child: ListView.builder(
//                   key: ValueKey(selectedDay),
//                   itemCount: program[selectedDay]?.length ?? 0,
//                   itemBuilder: (context, index) {
//                     final exercise = program[selectedDay]![index];

//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => ExerciseExampleScreen(
//                               exercise: {
//                                 'exercise': exercise['exercise'] ?? '',
//                                 'sets': exercise['sets'] ?? '',
//                                 'reps': exercise['reps'] ?? '',
//                                 'description': exercise['description'] ?? '',
//                                 'imageStart': exercise['imageStart'] ?? '',
//                                 'imageEnd': exercise['imageEnd'] ?? '',
//                                 'video': exercise['video'] ?? '',
//                               },
//                             ),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(vertical: 8),
//                         padding: const EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).cardColor,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.fitness_center,
//                               color: Theme.of(context).colorScheme.primary,
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     exercise['exercise'] ?? '',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .titleMedium
//                                         ?.copyWith(fontWeight: FontWeight.bold),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     "${t.sets}: ${exercise['sets']} | ${t.reps}: ${exercise['reps']}",
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodySmall,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),

//             if (program.isEmpty)
//               Center(
//                 child: Text(
//                   t.noWorkoutProgram,
//                   style: Theme.of(context).textTheme.bodyMedium,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
