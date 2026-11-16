import 'package:flutter/material.dart';
import '../../constants/majuride_driver_theme.dart';
import 'peta_menuju_tujuan_screen.dart';

/// Screen: Peta Penjemputan Penumpang (Node 8864:2641 & 8864:2823)
/// Tampilan navigasi driver menuju titik penjemputan penumpang dan konfirmasi kedatangan
class PetaJemputPenumpangScreen extends StatefulWidget {
  const PetaJemputPenumpangScreen({super.key});

  @override
  State<PetaJemputPenumpangScreen> createState() => _PetaJemputPenumpangScreenState();
}

class _PetaJemputPenumpangScreenState extends State<PetaJemputPenumpangScreen> {
  bool _sudahSampai = false;

  void _onActionButtonPressed() {
    if (!_sudahSampai) {
      setState(() {
        _sudahSampai = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Notifikasi telah dikirim ke Penumpang bahwa driver telah sampai'),
          backgroundColor: MajuRideDriverTheme.primaryGreen,
        ),
      );
    } else {
      // Penumpang naik, mulai perjalanan menuju destinasi
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const PetaMenujuTujuanScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Full-screen Map Background
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

          // 3. Top Navigation Card (Node 8864:2641 / 8864:2823)
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
                    child: Icon(
                      _sudahSampai ? Icons.person_pin_circle_rounded : Icons.turn_right_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _sudahSampai
                              ? 'Sudah di Titik Penjemputan'
                              : '200m Belok Kanan ke Jl. Merdeka',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _sudahSampai
                              ? 'Notifikasi telah dikirim ke Penumpang'
                              : 'Jemput Penumpang • Estimasi 3 Menit',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white.withValues(alpha: 0.9),
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
                      '0.8 km',
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

          // 4. Bottom Passenger Card (Node 8864:2641)
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
                      // Passenger Avatar "A"
                      Container(
                        width: 44,
                        height: 44,
                        decoration: const BoxDecoration(
                          color: MajuRideDriverTheme.mintLight,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            'A',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: MajuRideDriverTheme.primaryGreen,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Azkia (Penumpang)',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: MajuRideDriverTheme.textBlack,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Penjemputan: Jl. Merdeka No. 45',
                              style: TextStyle(
                                fontSize: 12,
                                color: MajuRideDriverTheme.textGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Chat Button
                      InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Membuka chat dengan penumpang Azkia...')),
                          );
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
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
                      ),
                      const SizedBox(width: 8),
                      // Call Button
                      InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Menghubungi penumpang Azkia...')),
                          );
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF1F5F9),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.phone_outlined,
                            size: 18,
                            color: MajuRideDriverTheme.textBlack,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Main Action Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _onActionButtonPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF008A59),
                        foregroundColor: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _sudahSampai ? Icons.play_arrow_rounded : Icons.location_on,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _sudahSampai
                                ? 'MULAI PERJALANAN'
                                : 'SAYA SUDAH SAMPAI DI TITIK JEMPUT',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
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
