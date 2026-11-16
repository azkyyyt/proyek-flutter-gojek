import 'dart:async';
import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import 'halaman_dashboard_screen.dart';

/// Screen: Splash Screen Penumpang / Customer
/// Figma Node: 8924:3131 (apk MajuRide)
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Splash screen tampil jelas selama 3 detik lalu otomatis menuju Onboarding/Welcome
    _timer = Timer(const Duration(seconds: 3), _goToWelcome);
  }

  void _goToWelcome() {
    if (mounted) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, anim, secAnim) => const HalamanDashboardScreen(),
          transitionsBuilder: (context, animation, secAnim, child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: _goToWelcome,
        behavior: HitTestBehavior.opaque,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo MajuRide dalam White Rounded Card bershadow sesuai Figma Node 8924:3131
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.07),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/majuride_logo_clean.png',
                    width: 72,
                    height: 72,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                // Heading: MajuRide (bold emerald green)
                const Text(
                  'MajuRide',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: MajuRideTheme.primaryGreen,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
