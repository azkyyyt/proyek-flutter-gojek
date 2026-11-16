import 'dart:async';
import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import '../keuangan/pembayaran_selesai_screen.dart';

class QrisPaymentScreen extends StatefulWidget {
  final String amount;

  const QrisPaymentScreen({
    super.key,
    this.amount = 'Rp 12.000',
  });

  @override
  State<QrisPaymentScreen> createState() => _QrisPaymentScreenState();
}

class _QrisPaymentScreenState extends State<QrisPaymentScreen> {
  int _secondsRemaining = 284; // 4 menit 44 detik
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _timeString {
    final mins = _secondsRemaining ~/ 60;
    final secs = _secondsRemaining % 60;
    return '$mins menit : ${secs.toString().padLeft(2, '0')} detik';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              // Top Bar (Figma Node 8875:1477)
              Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: MajuRideTheme.buttonGrey,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.close,
                          size: 18, color: MajuRideTheme.textDark),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'MajuRide QRIS Payment',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: MajuRideTheme.textDark,
                      ),
                    ),
                  ),
                  const SizedBox(width: 36),
                ],
              ),
              const SizedBox(height: 20),

              // QR Code Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: MajuRideTheme.cardBorder),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/qris_code.png',
                      width: 220,
                      height: 220,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 200,
                        height: 200,
                        color: MajuRideTheme.buttonGrey,
                        child: const Icon(Icons.qr_code_2, size: 160),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'Scan atau download QRIS untuk melanjutkan\npembayaran Anda melalui E-Wallet atau Mobile Banking',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.5,
                  color: MajuRideTheme.textGrey,
                  height: 1.35,
                ),
              ),

              const SizedBox(height: 20),

              // Sisa Waktu Pembayaran Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF3C7).withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFFDE68A)),
                ),
                child: Column(
                  children: [
                    const Text(
                      'SISA WAKTU PEMBAYARAN',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: MajuRideTheme.textDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.access_time,
                            size: 16, color: MajuRideTheme.textDark),
                        const SizedBox(width: 6),
                        Text(
                          _timeString,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: MajuRideTheme.textDark,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Metode Pembayaran Card
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: MajuRideTheme.bgLight,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: MajuRideTheme.cardBorder),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Metode Pembayaran',
                      style: TextStyle(
                        fontSize: 13,
                        color: MajuRideTheme.textGrey,
                      ),
                    ),
                    Row(
                      children: [
                        Text('⬛', style: TextStyle(fontSize: 14)),
                        SizedBox(width: 6),
                        Text(
                          'QRIS',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: MajuRideTheme.textDark,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Jumlah Tagihan Card
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: MajuRideTheme.bgLight,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: MajuRideTheme.cardBorder),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Jumlah Tagihan',
                      style: TextStyle(
                        fontSize: 13,
                        color: MajuRideTheme.textGrey,
                      ),
                    ),
                    Text(
                      widget.amount,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: MajuRideTheme.textDark,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Download QRIS Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MajuRideTheme.primaryGreen,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PembayaranSelesaiScreen(
                          merchantName: 'Rayyan putri',
                          amount: widget.amount,
                          serviceType: 'QRIS',
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Download QRIS',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
