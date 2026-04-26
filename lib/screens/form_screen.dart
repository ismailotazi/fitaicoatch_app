import 'package:flutter/material.dart';
import 'package:fitaicoatch_app/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  String _goal = 'Bulking';
  String _gender = 'Male';
  String _planType = 'Workout';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _weightController.text = prefs.getString("weight") ?? "";
      _heightController.text = prefs.getString("height") ?? "";

      _gender = prefs.getString("gender") ?? "Male";
      _goal = prefs.getString("goal") ?? "Bulking";
      _planType = prefs.getString("planType") ?? "Workout";
    });
  }

  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("weight", _weightController.text);
    await prefs.setString("height", _heightController.text);

    await prefs.setString("gender", _gender);
    await prefs.setString("goal", _goal);
    await prefs.setString("planType", _planType);
  }

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(t.fillDetails), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _inputField(
                child: TextFormField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: _decoration(t.weight),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return t.enterWeight;
                    }
                    if (double.tryParse(val) == null) {
                      return t.invalidNumber;
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 16),

              _inputField(
                child: TextFormField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: _decoration(t.height),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return t.enterHeight;
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 20),

              Text(t.gender, style: Theme.of(context).textTheme.titleMedium),

              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      value: "Male",
                      groupValue: _gender,
                      title: Text(t.male),
                      onChanged: (val) => setState(() => _gender = val!),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      value: "Female",
                      groupValue: _gender,
                      title: Text(t.female),
                      onChanged: (val) => setState(() => _gender = val!),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              _inputField(
                child: DropdownButtonFormField<String>(
                  value: _goal,
                  decoration: _decoration(t.goal),
                  items: [
                    DropdownMenuItem(value: 'Bulking', child: Text(t.bulking)),
                    DropdownMenuItem(value: 'Cutting', child: Text(t.cutting)),
                    DropdownMenuItem(value: 'Fitness', child: Text(t.fitness)),
                  ],
                  onChanged: (val) => setState(() => _goal = val!),
                ),
              ),

              const SizedBox(height: 16),

              _inputField(
                child: DropdownButtonFormField<String>(
                  value: _planType,
                  decoration: _decoration(t.planType),
                  items: [
                    DropdownMenuItem(value: 'Workout', child: Text(t.workout)),
                    DropdownMenuItem(
                      value: 'Meal Plan',
                      child: Text(t.mealPlan),
                    ),
                  ],
                  onChanged: (val) => setState(() => _planType = val!),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await _saveUserData();

                      Navigator.pushNamed(
                        context,
                        '/loading',
                        arguments: {
                          'weight': _weightController.text,
                          'height': _heightController.text,
                          'goal': _goal,
                          'gender': _gender,
                          'planType': _planType,
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 3,
                  ),
                  child: Text(
                    t.generateProgram,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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

  Widget _inputField({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: child,
    );
  }

  InputDecoration _decoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
