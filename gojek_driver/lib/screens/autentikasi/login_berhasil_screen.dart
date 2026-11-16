import 'dart:async';
import 'package:flutter/material.dart';
import '../../constants/majuride_driver_theme.dart';
import '../driver_main_navigation.dart';

/// Screen: Login Berhasil Driver (Node 7:353)
/// Konfirmasi autentikasi sukses dengan transisi otomatis ke halaman utama driver
class LoginBerhasilScreen extends StatefulWidget {
  final String driverName;

  const LoginBerhasilScreen({
    super.key,
    this.driverName = 'Budi Santoso',
  });

  @override
  State<LoginBerhasilScreen> createState() => _LoginBerhasilScreenState();
}

class _LoginBerhasilScreenState extends State<LoginBerhasilScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  Timer? _redirectTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _controller.forward();

    _redirectTimer = Timer(const Duration(milliseconds: 2200), _goToDashboard);
  }

  void _goToDashboard() {
    _redirectTimer?.cancel();
    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const DriverMainNavigation()),
        (route) => false,
      );
    }
  }

  @override
  void dispose() {
    _redirectTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Green Header Card with curved bottom
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 24, left: 24, right: 24),
            decoration: const BoxDecoration(
              color: MajuRideDriverTheme.primaryGreen,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, ${widget.driverName}!',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Mitra Driver Siap Narik',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Centered Success Animation
          ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: MajuRideDriverTheme.mintLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.two_wheeler_rounded,
                size: 42,
                color: MajuRideDriverTheme.primaryGreen,
              ),
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'LOGIN DRIVER BERHASIL!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: MajuRideDriverTheme.textBlack,
              letterSpacing: -0.4,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Anda berhasil masuk ke aplikasi Driver.',
            style: TextStyle(
              fontSize: 14,
              color: MajuRideDriverTheme.textGrey,
            ),
          ),

          const SizedBox(height: 28),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _goToDashboard,
                style: ElevatedButton.styleFrom(
                  backgroundColor: MajuRideDriverTheme.primaryGreen,
                  foregroundColor: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  'Buka Dashboard Driver',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
