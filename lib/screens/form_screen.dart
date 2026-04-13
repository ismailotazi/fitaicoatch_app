import 'package:flutter/material.dart';
import 'package:fitaicoatch_app/l10n/app_localizations.dart';

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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
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
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    t.generateProgram,
                    style: const TextStyle(color: Colors.white),
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
