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
      backgroundColor: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Row(
                children: [
                  const Icon(Icons.language, size: 26),
                  const SizedBox(width: 10),
                  Text(
                    "Choose Language 🌍",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // English
              _buildLanguageTile(
                flag: "🇬🇧",
                title: "English",
                onTap: () {
                  MyApp.of(context)?.setLocale(const Locale('en'));
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 10),

              // Arabic
              _buildLanguageTile(
                flag: "🇲🇦",
                title: "العربية",
                onTap: () {
                  MyApp.of(context)?.setLocale(const Locale('ar'));
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 10),

              // French (NEW 🇫🇷)
              _buildLanguageTile(
                flag: "🇫🇷",
                title: "Français",
                onTap: () {
                  final appState = MyApp.of(context);
                  appState?.setLocale(const Locale('fr'));
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  // 🔥 reusable widget (design clean)
  Widget _buildLanguageTile({
    required String flag,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
        ),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 26)),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
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
    final width = MediaQuery.of(context).size.width;
    final isTablet = width > 600;
    final isWeb = width > 1000;

    final logoSize = isWeb
        ? 220.0
        : isTablet
        ? 180.0
        : width * 0.35;

    final padding = isWeb
        ? 80.0
        : isTablet
        ? 40.0
        : 24.0;

    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        height: logoSize,
                        width: logoSize,
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
                      style: TextStyle(
                        fontSize: isWeb ? 24 : 20,
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
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          elevation: 3,
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.start,
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
          ),
        ),
      ),
    );
  }
}
