import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Fill in Your Details",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              /// Weight
              _animatedInput(
                child: TextFormField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: _style("Weight (kg)"),
                  validator: (val) {
                    if (val == null || val.isEmpty) return "Enter your weight";
                    if (double.tryParse(val) == null) return "Invalid number";
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),

              /// Height
              _animatedInput(
                child: TextFormField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: _style("Height (cm)"),
                  validator: (val) {
                    if (val == null || val.isEmpty) return "Enter your height";
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),

              /// Gender Selector
              const Text(
                "Gender",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              _animatedInput(
                child: Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Male"),
                        value: "Male",
                        groupValue: _gender,
                        onChanged: (val) {
                          setState(() => _gender = val!);
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Female"),
                        value: "Female",
                        groupValue: _gender,
                        onChanged: (val) {
                          setState(() => _gender = val!);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// Goal Dropdown
              _animatedInput(
                child: DropdownButtonFormField<String>(
                  value: _goal,
                  decoration: _style("Goal"),
                  items: ['Bulking', 'Cutting', 'Fitness']
                      .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                      .toList(),
                  onChanged: (val) => setState(() => _goal = val!),
                ),
              ),

              const SizedBox(height: 16),

              /// Plan Type Dropdown
              _animatedInput(
                child: DropdownButtonFormField<String>(
                  value: _planType,
                  decoration: _style("Plan Type"),
                  items: ['Workout', 'Meal Plan']
                      .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                      .toList(),
                  onChanged: (val) => setState(() => _planType = val!),
                ),
              ),

              const SizedBox(height: 40),

              /// Generate Program Button
              _animatedInput(
                child: ElevatedButton(
                  onPressed: () {
                    try {
                      if (_formKey.currentState!.validate()) {
                        final weight = double.parse(_weightController.text);
                        final height = double.parse(_heightController.text);

                        Navigator.pushNamed(
                          context,
                          '/loading',
                          arguments: {
                            'weight': weight.toString(),
                            'height': height.toString(),
                            'goal': _goal,
                            'gender': _gender,
                            'planType': _planType,
                          },
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter valid numbers'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: const Color(0xFF2563EB),
                  ),
                  child: const Text(
                    "Generate Program",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Animated Input Wrapper
  Widget _animatedInput({required Widget child}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: child,
    );
  }

  InputDecoration _style(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }
}
