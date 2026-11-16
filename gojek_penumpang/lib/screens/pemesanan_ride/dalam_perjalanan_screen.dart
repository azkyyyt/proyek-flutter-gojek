import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import 'rating_ulasan_screen.dart';

class DalamPerjalananScreen extends StatelessWidget {
  final String driverName;
  final String destination;
  final String price;

  const DalamPerjalananScreen({
    super.key,
    this.driverName = 'Budi Santoso',
    this.destination = 'Stasiun Gambir',
    this.price = 'Rp 14.000',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MajuRideTheme.bgGrey,
      appBar: AppBar(
        backgroundColor: MajuRideTheme.surfaceWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MajuRideTheme.textDark),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/beranda');
            }
          },
        ),
        title: const Text(
          'Dalam Perjalanan',
          style: TextStyle(
            color: MajuRideTheme.textDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shield_outlined, color: MajuRideTheme.darkGreen),
            tooltip: 'Fitur Keamanan',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Perjalanan ini dipantau oleh sistem keamanan 24/7 MajuRide'),
                  backgroundColor: MajuRideTheme.darkGreen,
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Peta Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/map_navigation.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(color: const Color(0xFFD1E7DD)),
            ),
          ),

          // Bottom Trip Card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: MajuRideTheme.surfaceWhite,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2)),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Estimasi Tiba di Tujuan',
                            style: TextStyle(fontSize: 12, color: MajuRideTheme.textGrey, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            '12 Menit Lagi (14:35 WIB)',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: MajuRideTheme.darkGreen),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: MajuRideTheme.lightGreen,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text('Tetap di Rute', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: MajuRideTheme.darkGreen)),
                      ),
                    ],
                  ),
                  const Divider(height: 20),
                  Row(
                    children: [
                      const Icon(Icons.flag_rounded, color: MajuRideTheme.redDanger, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          destination,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MajuRideTheme.primaryGreen,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RatingUlasanScreen(
                              driverName: driverName,
                              destination: destination,
                              price: price,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Tiba di Tujuan • Selesaikan Perjalanan',
                        style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.bold),
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
