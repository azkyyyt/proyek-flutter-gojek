import 'package:flutter/material.dart';
import '../../constants/majuride_driver_theme.dart';
import 'rating_penumpang_screen.dart';

/// Screen: Perjalanan Selesai & Rincian Tarif (Node 8864:2991)
/// Ringkasan rincian komisi, pendapatan bersih driver, dan update saldo dompet
class PerjalananSelesaiScreen extends StatelessWidget {
  const PerjalananSelesaiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 36),

              // Green check icon
              Container(
                width: 68,
                height: 68,
                decoration: const BoxDecoration(
                  color: MajuRideDriverTheme.mintLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: MajuRideDriverTheme.primaryGreen,
                  size: 38,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Perjalanan Selesai!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: MajuRideDriverTheme.textBlack,
                  letterSpacing: -0.3,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Pendapatan perjalanan telah otomatis ditambahkan ke Dompet Driver Anda.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: MajuRideDriverTheme.textGrey,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 32),

              // Card 1: Rincian Pendapatan Driver
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: MajuRideDriverTheme.borderGrey),
                  boxShadow: MajuRideDriverTheme.cardShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Rincian Pendapatan Driver',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: MajuRideDriverTheme.textBlack,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Divider(height: 1, color: Color(0xFFF1F5F9)),
                    const SizedBox(height: 14),

                    // Tarif
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Tarif Perjalanan:',
                          style: TextStyle(
                            fontSize: 13,
                            color: MajuRideDriverTheme.textGrey,
                          ),
                        ),
                        Text(
                          'Rp 12.000',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: MajuRideDriverTheme.textBlack,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Komisi
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Potongan Komisi Aplikasi (8.3%):',
                          style: TextStyle(
                            fontSize: 13,
                            color: MajuRideDriverTheme.textGrey,
                          ),
                        ),
                        Text(
                          '-Rp 1.000',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFEF4444),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),
                    const Divider(height: 1, color: Color(0xFFF1F5F9)),
                    const SizedBox(height: 14),

                    // Bersih
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Bersih Masuk Dompet:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: MajuRideDriverTheme.textBlack,
                          ),
                        ),
                        Text(
                          'Rp 11.000',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: MajuRideDriverTheme.primaryGreen,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Card 2: Saldo Dompet Sekarang
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FDF4),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFBBF7D0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Saldo Dompet Sekarang:',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: MajuRideDriverTheme.primaryGreen,
                      ),
                    ),
                    Text(
                      'Rp 256.000',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: MajuRideDriverTheme.primaryGreen,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Button: Lanjut ke Rating Penumpang
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const RatingPenumpangScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF008A59),
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'LANJUT KE RATING PENUMPANG',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
