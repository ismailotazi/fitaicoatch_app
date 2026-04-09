import 'package:flutter/material.dart';

class SaveShareScreen extends StatelessWidget {
  const SaveShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("حفظ / مشاركة")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // TODO: Save program locally
              },
              child: const Text("Save Program"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Share program
              },
              child: const Text("Share Program"),
            ),
          ],
        ),
      ),
    );
  }
}
