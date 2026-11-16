import 'dart:async';
import 'package:flutter/material.dart';
import '../../constants/majuride_driver_theme.dart';
import 'peta_jemput_penumpang_screen.dart';

/// Modal: Pesanan Masuk Driver (Node 8849:2595)
/// Bottom sheet pesanan masuk dengan rincian titik jemput, tujuan, tarif bersih,
/// dan batas waktu penerimaan pesanan
class PesananMasukModal extends StatefulWidget {
  const PesananMasukModal({super.key});

  @override
  State<PesananMasukModal> createState() => _PesananMasukModalState();
}

class _PesananMasukModalState extends State<PesananMasukModal> {
  int _secondsLeft = 15;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        setState(() {
          _secondsLeft--;
        });
      } else {
        timer.cancel();
        if (mounted) {
          Navigator.of(context).pop();
        }
      }
    });
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  void _onTerimaPesanan() {
    _countdownTimer?.cancel();
    Navigator.of(context).pop(); // close modal
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const PetaJemputPenumpangScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top Floating Alert Pill (Node 8849:2595)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF43F5E),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFF43F5E).withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.two_wheeler_rounded, color: Colors.white, size: 18),
                const SizedBox(width: 8),
                Text(
                  'PESANAN MajuRide MASUK! (${_secondsLeft}s)',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Main Bottom Sheet Card
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Service Info Header
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: const BoxDecoration(
                          color: MajuRideDriverTheme.mintLight,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.electric_moped_rounded,
                          color: MajuRideDriverTheme.primaryGreen,
                          size: 26,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'MajuRide Standard',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: MajuRideDriverTheme.textBlack,
                              ),
                            ),
                            const SizedBox(height: 3),
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 12,
                                  color: MajuRideDriverTheme.textGrey,
                                ),
                                children: [
                                  TextSpan(text: 'Jarak Penjemputan: '),
                                  TextSpan(
                                    text: '0.8 km (3 Menit)',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MajuRideDriverTheme.primaryGreen,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Green Earnings Container
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0FDF4),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFBBF7D0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Pendapatan Bersih Driver',
                              style: TextStyle(
                                fontSize: 11,
                                color: MajuRideDriverTheme.textGrey,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Rp 12.000',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: MajuRideDriverTheme.primaryGreen,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: MajuRideDriverTheme.primaryGreen.withValues(alpha: 0.5)),
                          ),
                          child: const Text(
                            '💳 Non-Tunai (QRIS / Saldo)',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: MajuRideDriverTheme.primaryGreen,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Route Card
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: MajuRideDriverTheme.borderGrey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Titik Jemput
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 3),
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: MajuRideDriverTheme.primaryGreen,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'TITIK PENJEMPUTAN (0.8 KM)',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: MajuRideDriverTheme.textGrey,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Jl. Merdeka No. 45',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: MajuRideDriverTheme.textBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // Vertical connecting line
                        Container(
                          margin: const EdgeInsets.only(left: 4.5),
                          height: 18,
                          width: 1,
                          color: const Color(0xFFCBD5E1),
                        ),

                        // Titik Tujuan
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 3),
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Color(0xFFEF4444),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'TITIK TUJUAN (3.8 KM)',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: MajuRideDriverTheme.textGrey,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Grand Indonesia Shopping Town',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: MajuRideDriverTheme.textBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Action Buttons: Tolak vs Terima Pesanan
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF1F5F9),
                              foregroundColor: MajuRideDriverTheme.textBlack,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: const Text(
                              'Tolak',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 4,
                        child: SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: _onTerimaPesanan,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF008A59),
                              foregroundColor: Colors.white,
                              elevation: 2,
                              shadowColor: const Color(0xFF008A59).withValues(alpha: 0.4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.check_circle_outline, size: 18),
                                SizedBox(width: 6),
                                Text(
                                  'TERIMA PESANAN',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
