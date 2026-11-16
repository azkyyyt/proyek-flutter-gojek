import 'dart:async';
import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import 'driver_ditemukan_screen.dart';

class MencariDriverScreen extends StatefulWidget {
  final String fleetType;
  final String price;
  final String pickupLocation;
  final String destinationLocation;

  const MencariDriverScreen({
    super.key,
    this.fleetType = 'MajuRide Standard',
    this.price = 'Rp 12.000',
    this.pickupLocation = 'Lokasi saat ini',
    this.destinationLocation = 'Komplek TNI-AD RUDAL 001',
  });

  @override
  State<MencariDriverScreen> createState() => _MencariDriverScreenState();
}

class _MencariDriverScreenState extends State<MencariDriverScreen> {
  Timer? _autoFoundTimer;

  @override
  void initState() {
    super.initState();
    _autoFoundTimer = Timer(const Duration(seconds: 4), () {
      if (mounted) {
        _onDriverFound();
      }
    });
  }

  @override
  void dispose() {
    _autoFoundTimer?.cancel();
    super.dispose();
  }

  void _onDriverFound() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DriverDitemukanScreen(
          fleetType: widget.fleetType,
          price: widget.price,
          pickupLocation: widget.pickupLocation,
          destinationLocation: widget.destinationLocation,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            children: [
              const Spacer(flex: 3),

              // Mint Circle with Scooter (Figma Node 8737:2747)
              GestureDetector(
                onTap: _onDriverFound,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD1FAE5),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: MajuRideTheme.primaryGreen,
                      width: 2,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text('🛵', style: TextStyle(fontSize: 48)),
                ),
              ),
              const SizedBox(height: 28),

              // Title and Subtitle
              const Text(
                'Mencari Driver MajuRide...',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: MajuRideTheme.textDark,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Estimasi Waktu: ~1–2 Menit',
                style: TextStyle(
                  fontSize: 13,
                  color: MajuRideTheme.textGrey,
                ),
              ),

              const Spacer(flex: 4),

              // Batalkan Pesanan Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MajuRideTheme.buttonGrey,
                    foregroundColor: MajuRideTheme.redDanger,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    _autoFoundTimer?.cancel();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushReplacementNamed(context, '/beranda');
                    }
                  },
                  child: const Text(
                    'Batalkan Pesanan',
                    style: TextStyle(
                      fontSize: 14,
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
