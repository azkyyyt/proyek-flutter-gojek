import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import '../pesan/chat_driver_screen.dart';
import 'dalam_perjalanan_screen.dart';

class DriverDitemukanScreen extends StatelessWidget {
  final String fleetType;
  final String price;
  final String pickupLocation;
  final String destinationLocation;

  const DriverDitemukanScreen({
    super.key,
    required this.fleetType,
    required this.price,
    required this.pickupLocation,
    required this.destinationLocation,
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
          'Driver Menuju Titik Jemput',
          style: TextStyle(
            color: MajuRideTheme.textDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
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

          // Floating Driver Status Card
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
                children: [
                  // Status & ETA
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Driver Sedang Menuju ke Anda',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: MajuRideTheme.darkGreen),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Tiba dalam 3 menit',
                            style: TextStyle(fontSize: 12, color: MajuRideTheme.textGrey),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: MajuRideTheme.lightGreen,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          price,
                          style: const TextStyle(fontWeight: FontWeight.bold, color: MajuRideTheme.darkGreen),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24),

                  // Driver Details
                  Row(
                    children: [
                      Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: MajuRideTheme.cardBorder),
                        ),
                        child: Image.asset(
                          'assets/images/avatar_driver.png',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 36),
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Budi Santoso',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Honda Vario 160 • B 4521 TZX',
                              style: TextStyle(fontSize: 12.5, color: MajuRideTheme.textGrey, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 2),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 14),
                                SizedBox(width: 4),
                                Text('4.9 (1.200+ perjalanan)', style: TextStyle(fontSize: 11.5, color: MajuRideTheme.textLight)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Chat & Phone Buttons
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.chat_bubble_outline_rounded, color: MajuRideTheme.primaryGreen),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ChatDriverScreen(),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.phone_outlined, color: MajuRideTheme.primaryGreen),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Menghubungi driver Budi Santoso...'),
                                  backgroundColor: MajuRideTheme.primaryGreen,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // CTA Button
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
                            builder: (context) => DalamPerjalananScreen(
                              driverName: 'Budi Santoso',
                              destination: destinationLocation,
                              price: price,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Sudah Naik • Mulai Perjalanan',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
