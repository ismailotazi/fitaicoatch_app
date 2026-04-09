import 'package:fitaicoatch_app/screens/exercice_example_screen.dart';
import 'package:fitaicoatch_app/screens/meal_screen.dart';
import 'package:flutter/material.dart';
import '../services/program_generator.dart';

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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (isInit) return;
    isInit = true;

    final routeData = ModalRoute.of(context)?.settings.arguments;
    if (routeData == null) return;

    final data = routeData as Map<String, String>;

    gender = data['gender'] ?? 'Male';
    planType = data['planType'] ?? 'Workout';

    if (planType != 'Meal Plan') {
      program = ProgramGenerator().generateProgram(
        goal: data['goal'] ?? 'Fitness',
        weight: double.tryParse(data['weight'] ?? '') ?? 70,
        height: double.tryParse(data['height'] ?? '') ?? 170,
        gender: gender,
      );

      if (program.isNotEmpty) {
        selectedDay = program.keys.first;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (planType == 'Meal Plan') {
      final data =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>? ??
          {};
      return MealScreen(
        data: {
          'goal': data['goal'] ?? 'Fitness',
          'gender': data['gender'] ?? 'Male',
        },
      );
    }

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Workout Program 💪",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Chip(
              label: Text(gender),
              backgroundColor: Colors.blue.shade50,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 🔥 Days selector (horizontal like fitness apps)
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
                          color: isSelected ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            if (isSelected)
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.3),
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

            /// 🔥 Animated exercises list
            if (program.isNotEmpty && selectedDay.isNotEmpty)
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
                  child: ListView.builder(
                    key: ValueKey(selectedDay), // 🔥 مهم للأنيميشن
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
                                  'exercise': exercise['exercise'] ?? 'No Name',
                                  'sets': exercise['sets'] ?? '0',
                                  'reps': exercise['reps'] ?? '0',
                                  'description':
                                      exercise['description'] ??
                                      'No description available',
                                  'imageStart':
                                      exercise['imageStart'] ??
                                      'images/default_begin.jpg',
                                  'imageEnd':
                                      exercise['imageEnd'] ??
                                      'images/default_end.jpg',
                                  'video':
                                      exercise['video'] ??
                                      '', // si bghiti t7ll video button
                                },
                              ),
                            ),
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white, Colors.blue.shade50],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 6),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade100,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.fitness_center,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      exercise['exercise'] ?? 'No Name',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "Sets: ${exercise['sets']} | Reps: ${exercise['reps']}",
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(Icons.arrow_forward_ios, size: 16),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

            if (program.isEmpty)
              const Center(child: Text("No workout program available")),
          ],
        ),
      ),
    );
  }
}
