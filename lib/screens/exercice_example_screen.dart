import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fitaicoatch_app/l10n/app_localizations.dart';
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,

        foregroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,

        title: Text(
          widget.exercise['exercise'] ??
              AppLocalizations.of(context)!.workoutProgram,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🖼 IMAGE SLIDER (FIXED WEB + EMULATOR)
            SizedBox(
              height: 250,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                physics: const PageScrollPhysics(),
                itemCount: imagePaths.length,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: double.infinity,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 15,
                                sigmaY: 15,
                              ),
                              child: Image.asset(
                                imagePaths[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(color: Colors.black.withOpacity(0.25)),
                            Center(
                              child: Image.asset(
                                imagePaths[index],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),

            /// 🔘 DOTS
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
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// 🏋️ TITLE
            Text(
              widget.exercise['exercise'] ??
                  AppLocalizations.of(context)!.workoutProgram,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            /// 📊 SETS + REPS
            Text(
              "${AppLocalizations.of(context)!.sets}: ${widget.exercise['sets']} | ${AppLocalizations.of(context)!.reps}: ${widget.exercise['reps']}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 12),

            Text(
              AppLocalizations.of(context)!.workoutProgram,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 6),

            /// 📖 DESCRIPTION
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  widget.exercise['description'] ??
                      "This exercise focuses on building strength and form.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// ▶️ BUTTON
            SafeArea(
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final videoUrl = widget.exercise['video'];
                    if (videoUrl != null && videoUrl.isNotEmpty) {
                      await launchUrl(Uri.parse(videoUrl));
                    }
                  },
                  icon: const Icon(Icons.play_circle_fill),
                  label: Text(
                    AppLocalizations.of(context)!.watchVideo,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
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
