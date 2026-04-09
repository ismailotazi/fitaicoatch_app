import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExerciseExampleScreen extends StatefulWidget {
  final Map<String, String> exercise;

  const ExerciseExampleScreen({super.key, required this.exercise});

  @override
  State<ExerciseExampleScreen> createState() => _ExerciseExampleScreenState();
}

class _ExerciseExampleScreenState extends State<ExerciseExampleScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final imagePaths = [
      widget.exercise['imageStart'] ?? 'images/default_begin.jpg',
      widget.exercise['imageEnd'] ?? 'images/default_end.jpg',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.exercise['exercise'] ?? 'Exercise',
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ PageView 2 Images Slidable
            SizedBox(
              height: 250,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imagePaths.length,
                onPageChanged: (index) => setState(() => _currentIndex = index),
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(3, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // 🔥 Blurred background مع fallback
                          ImageFiltered(
                            imageFilter: ImageFilter.blur(
                              sigmaX: 15,
                              sigmaY: 15,
                            ),
                            child: Image.asset(
                              imagePaths[index],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                String fallback = index == 0
                                    ? 'images/default_begin.jpg'
                                    : 'images/default_end.jpg';
                                return Image.asset(fallback, fit: BoxFit.cover);
                              },
                            ),
                          ),

                          // overlay بسيط على الخلفية
                          Container(color: Colors.black.withOpacity(0.3)),

                          // ✅ الصورة الأصلية واضحة + fallback
                          Center(
                            child: Image.asset(
                              imagePaths[index],
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                String fallback = index == 0
                                    ? 'images/default_begin.jpg'
                                    : 'images/default_end.jpg';
                                return Image.asset(
                                  fallback,
                                  fit: BoxFit.contain,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),

            // ✅ Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imagePaths.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentIndex == index ? 12 : 8,
                  height: _currentIndex == index ? 12 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.blue
                        : Colors.grey[400],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ✅ Title + Sets/Reps
            Text(
              widget.exercise['exercise'] ?? 'Exercise',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              "Sets: ${widget.exercise['sets']} | Reps: ${widget.exercise['reps']}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),

            const Text(
              "Description:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),

            // ✅ Scrollable description
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.25,
              ),
              child: SingleChildScrollView(
                child: Text(
                  widget.exercise['description'] ??
                      "This exercise focuses on building strength and form.",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ✅ Watch Video Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () async {
                  final videoUrl = widget.exercise['video'];
                  if (videoUrl != null && videoUrl.isNotEmpty) {
                    final uri = Uri.parse(videoUrl);
                    await launchUrl(uri);
                  }
                },
                icon: const Icon(Icons.play_circle_fill),
                label: const Text("Watch Video"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
