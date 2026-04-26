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
    final t = AppLocalizations.of(context)!;

    // ❌ check empty fields
    if (nameController.text.trim().isEmpty ||
        caloriesController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.red.withOpacity(0.9),
          content: Row(
            children: [
              const Icon(Icons.warning_amber_rounded, color: Colors.white),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  t.fillAllFields, // 👈 زيدها فـ localization
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      return;
    }

    // ✅ success snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.green.withOpacity(0.9),
        duration: const Duration(seconds: 2),
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                t.savedSuccessfully, // 👈 زيدها فـ localization
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // ⏳ delay صغير باش user يشوف message
    Future.delayed(const Duration(milliseconds: 600), () {
      Navigator.pop(
        context,
        Meal(
          name: nameController.text,
          calories: int.parse(caloriesController.text),
          date: DateTime.now(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // 🎨 COLORS (LIGHT + DARK)
    final primaryColor = const Color(0xFF2F5FD0);

    final bgColor = isDark ? const Color(0xFF0F0F10) : const Color(0xFFF2F2F2);

    final cardColor = isDark
        ? const Color(0xFF1A1A1D)
        : const Color(0xFFE6E0EC);

    final textColor = isDark ? Colors.white : const Color(0xFF333333);

    final shadowColor = Colors.black.withOpacity(isDark ? 0.25 : 0.05);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.addMeal,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
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
                  boxShadow: [BoxShadow(color: shadowColor, blurRadius: 10)],
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
                  boxShadow: [BoxShadow(color: shadowColor, blurRadius: 10)],
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
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      elevation: 3,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.save,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
