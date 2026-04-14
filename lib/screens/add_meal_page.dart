import 'package:fitaicoatch_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';

class AddMealPage extends StatefulWidget {
  final Meal? existingMeal;

  const AddMealPage({super.key, this.existingMeal});

  @override
  State<AddMealPage> createState() => _AddMealPageState();
}

class _AddMealPageState extends State<AddMealPage> {
  final nameController = TextEditingController();
  final caloriesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.existingMeal != null) {
      nameController.text = widget.existingMeal!.name;
      caloriesController.text = widget.existingMeal!.calories.toString();
    }
  }

  void save() {
    if (caloriesController.text.isEmpty) return;

    Navigator.pop(
      context,
      Meal(
        name: nameController.text,
        calories: int.parse(caloriesController.text),
        date: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 🎨 SAME COLORS
    final primaryColor = const Color(0xFF2F5FD0);
    final bgColor = const Color(0xFFF2F2F2);
    final cardColor = const Color(0xFFE6E0EC);
    final textColor = const Color(0xFF333333);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addMeal),
        backgroundColor: primaryColor,
      ),
      body: Container(
        color: bgColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🟪 NAME FIELD
              Container(
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: TextField(
                  controller: nameController,
                  style: TextStyle(color: textColor),
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.meal,
                    labelStyle: TextStyle(color: textColor),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // 🟪 CALORIES FIELD
              Container(
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: TextField(
                  controller: caloriesController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: textColor),
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.calories,
                    labelStyle: TextStyle(color: textColor),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: save,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text("Save", style: TextStyle(fontSize: 16)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
