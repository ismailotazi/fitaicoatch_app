import 'package:flutter/material.dart';
import 'package:fitaicoatch_app/main.dart';
import 'package:fitaicoatch_app/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.85,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// 🌍 Language switch
  void _changeLanguageDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "🌍 Language",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20),

              ListTile(
                leading: const Text("🇬🇧", style: TextStyle(fontSize: 24)),
                title: const Text("English"),
                onTap: () {
                  MyApp.of(context)?.setLocale(const Locale('en'));
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Text("🇲🇦", style: TextStyle(fontSize: 24)),
                title: const Text("العربية"),
                onTap: () {
                  MyApp.of(context)?.setLocale(const Locale('ar'));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// 📸 Instagram
  Future<void> _openInstagram() async {
    final Uri appUrl = Uri.parse("instagram://user?username=milotazi");
    final Uri webUrl = Uri.parse("https://www.instagram.com/milotazi/");

    if (await canLaunchUrl(appUrl)) {
      await launchUrl(appUrl);
    } else {
      await launchUrl(webUrl, mode: LaunchMode.externalApplication);
    }
  }

  /// 🔥 APP BAR
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text(
        "Milo Gym Coach",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.language),
          onPressed: _changeLanguageDialog,
        ),
        IconButton(
          icon: Icon(
            Theme.of(context).brightness == Brightness.dark
                ? Icons.light_mode
                : Icons.dark_mode,
          ),
          onPressed: () {
            final isDark = Theme.of(context).brightness == Brightness.dark;

            MyApp.of(
              context,
            )?.setThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
          },
        ),
        IconButton(
          icon: const Icon(Icons.camera_alt_outlined),
          onPressed: _openInstagram,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.35;

    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  height: size,
                  width: size,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFF2563EB), Color(0xFF3B82F6)],
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'images/off_splash.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Text(
                AppLocalizations.of(context)!.welcomeText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 50),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/form');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.start,
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
}
// import 'package:flutter/material.dart';

// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({super.key});

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );

//     _scaleAnimation = Tween<double>(
//       begin: 0.8,
//       end: 1.2,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         _controller.reverse();
//       } else if (status == AnimationStatus.dismissed) {
//         _controller.forward();
//       }
//     });

//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size.width * 0.35;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F7FB),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(24),
//             child: Column(
//               children: [
//                 const SizedBox(height: 80),

//                 // 🔹 Animated Circle with Image (App Icon)
//                 ScaleTransition(
//                   scale: _scaleAnimation,
//                   child: Container(
//                     height: size,
//                     width: size,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       gradient: LinearGradient(
//                         colors: [Color(0xFF2563EB), Color(0xFF3B82F6)],
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black26,
//                           blurRadius: 8,
//                           offset: Offset(2, 4),
//                         ),
//                       ],
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(size / 2),
//                       child: Image.asset(
//                         'images/splash.png', // ⚡ ضع هنا image app icon
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 40),

//                 const Text(
//                   "Get your workout & meal plan in seconds 💪🔥",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                 ),

//                 const SizedBox(height: 60),

//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/form');
//                     },
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 18),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       backgroundColor: const Color(0xFF2563EB),
//                       elevation: 6,
//                     ),
//                     child: const Text("Start", style: TextStyle(fontSize: 20)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
