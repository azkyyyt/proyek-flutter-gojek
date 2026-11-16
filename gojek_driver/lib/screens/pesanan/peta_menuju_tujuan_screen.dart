import 'package:flutter/material.dart';
import '../../constants/majuride_driver_theme.dart';
import 'perjalanan_selesai_screen.dart';

/// Screen: Peta Menuju Tujuan Penumpang (Node 8864:2877)
/// Layar navigasi aktif driver mengantarkan penumpang ke lokasi tujuan akhir
class PetaMenujuTujuanScreen extends StatefulWidget {
  const PetaMenujuTujuanScreen({super.key});

  @override
  State<PetaMenujuTujuanScreen> createState() => _PetaMenujuTujuanScreenState();
}

class _PetaMenujuTujuanScreenState extends State<PetaMenujuTujuanScreen> {
  void _onSelesaikanPerjalanan() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const PerjalananSelesaiScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Map Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/map_navigation.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: const Color(0xFFE2E8F0),
                child: const Center(
                  child: Icon(Icons.map, size: 80, color: Colors.grey),
                ),
              ),
            ),
          ),

          // 2. Circular Back Button to Return to Main Navigation
          Positioned(
            top: 44,
            left: 16,
            child: InkWell(
              onTap: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).pushReplacementNamed('/main_nav');
                }
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Color(0xFF1E293B),
                ),
              ),
            ),
          ),

          // 3. Top Navigation Card (Node 8864:2877)
          Positioned(
            top: 96,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF008A59),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.18),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.navigation_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Tujuan: Grand Indonesia Mall',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Penumpang: Azkia • MajuRide (Non-Tunai)',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Text(
                      '2.8 km',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 3. Driver Motor Marker on Map
          Center(
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF0F172A),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.two_wheeler_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),

          // 4. Bottom Destination Card
          Positioned(
            left: 16,
            right: 16,
            bottom: 24,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFEE2E2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.location_on_rounded,
                          color: Color(0xFFEF4444),
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Grand Indonesia Shopping Town',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: MajuRideDriverTheme.textBlack,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Estimasi Tiba: 8 Menit (Lancar)',
                              style: TextStyle(
                                fontSize: 12,
                                color: MajuRideDriverTheme.textGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Chat Button
                      Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          color: MajuRideDriverTheme.mintLight,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.chat_bubble_outline_rounded,
                          size: 18,
                          color: MajuRideDriverTheme.primaryGreen,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Button Selesaikan Perjalanan
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _onSelesaikanPerjalanan,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF008A59),
                        foregroundColor: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text(
                        'SELESAIKAN PERJALANAN',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
