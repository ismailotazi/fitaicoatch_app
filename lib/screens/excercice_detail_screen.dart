// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ExerciseDetailScreen extends StatefulWidget {
//   final Map<String, dynamic> exercise;

//   const ExerciseDetailScreen({super.key, required this.exercise});

//   @override
//   State<ExerciseDetailScreen> createState() => _ExerciseDetailScreenState();
// }

// class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
//   final PageController _pageController = PageController();
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     final images = [
//       widget.exercise['imageStart'] ?? 'images/chest.jpg',
//       widget.exercise['imageEnd'] ?? 'images/chest.jpg',
//     ];
//     final video = widget.exercise['video'];

//     return Scaffold(
//       appBar: AppBar(title: Text(widget.exercise['exercise'] ?? 'Exercise')),
//       body: Column(
//         children: [
//           // 🖼️ Image carousel
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.35,
//             child: PageView.builder(
//               controller: _pageController,
//               itemCount: images.length,
//               onPageChanged: (index) => setState(() => _currentIndex = index),
//               itemBuilder: (context, index) {
//                 return AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   margin: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 8,
//                   ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Colors.black26,
//                         blurRadius: 6,
//                         offset: Offset(2, 2),
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(16),
//                     child: Image.asset(
//                       images[index],
//                       fit: BoxFit.cover,
//                       errorBuilder: (context, error, stackTrace) =>
//                           Image.asset('images', fit: BoxFit.cover),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),

//           // 🔹 Dots indicator
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               images.length,
//               (index) => Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 4),
//                 width: _currentIndex == index ? 12 : 8,
//                 height: _currentIndex == index ? 12 : 8,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: _currentIndex == index
//                       ? Colors.blue
//                       : Colors.grey[400],
//                 ),
//               ),
//             ),
//           ),

//           const SizedBox(height: 16),

//           // 🏋️ Exercise info
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   widget.exercise['exercise'] ?? 'Exercise',
//                   style: const TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   "Sets: ${widget.exercise['sets'] ?? '0'} | Reps: ${widget.exercise['reps'] ?? '0'}",
//                   style: const TextStyle(fontSize: 16),
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   "Description:",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   widget.exercise['description'] ??
//                       "This exercise demonstrates proper form and technique.",
//                   style: const TextStyle(fontSize: 16),
//                 ),
//               ],
//             ),
//           ),

//           const Spacer(),

//           // ▶️ Watch Video button
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: SizedBox(
//               width: double.infinity,
//               child: ElevatedButton.icon(
//                 onPressed: () async {
//                   if (video != null) {
//                     final uri = Uri.parse(video);
//                     await launchUrl(uri);
//                   }
//                 },
//                 icon: const Icon(Icons.play_circle_fill),
//                 label: const Text(
//                   "Watch Video",
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   backgroundColor: Colors.redAccent,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
