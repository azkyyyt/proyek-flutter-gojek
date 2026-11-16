import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import '../pemesanan_ride/pemilihan_lokasi_screen.dart';

class DetailTransaksiScreen extends StatelessWidget {
  final String serviceName;
  final String title;
  final String date;
  final String price;

  const DetailTransaksiScreen({
    super.key,
    this.serviceName = 'MajuRide',
    this.title = 'Grand Indonesia ➔ Stasiun Gambir',
    this.date = 'Hari ini, 14:35 WIB',
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
              Navigator.pushReplacementNamed(context, '/aktivitas');
            }
          },
        ),
        title: const Text(
          'Detail Transaksi',
          style: TextStyle(
            color: MajuRideTheme.textDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Status
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: MajuRideTheme.surfaceWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: MajuRideTheme.cardBorder),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: MajuRideTheme.primaryGreen, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Transaksi Selesai', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                          const SizedBox(height: 2),
                          Text(date, style: const TextStyle(fontSize: 12, color: MajuRideTheme.textGrey)),
                        ],
                      ),
                    ),
                    Text(
                      price,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: MajuRideTheme.darkGreen),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Rute Perjalanan
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: MajuRideTheme.surfaceWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: MajuRideTheme.cardBorder),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rincian Perjalanan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    Divider(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.my_location, color: MajuRideTheme.primaryGreen, size: 18),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Titik Jemput', style: TextStyle(fontSize: 11, color: MajuRideTheme.textGrey)),
                              Text('Grand Indonesia Mall, Lobby Barat', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on, color: MajuRideTheme.redDanger, size: 18),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tujuan Pengantaran', style: TextStyle(fontSize: 11, color: MajuRideTheme.textGrey)),
                              Text('Stasiun Gambir, Pintu Masuk Timur', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Driver Information
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: MajuRideTheme.surfaceWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: MajuRideTheme.cardBorder),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: MajuRideTheme.bgGrey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/images/avatar_driver.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Budi Santoso', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          Text('Honda Vario 160 • B 4521 TZX', style: TextStyle(fontSize: 12, color: MajuRideTheme.textGrey)),
                        ],
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 2),
                        Text('5.0', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.5)),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // CTA Reorder
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MajuRideTheme.primaryGreen,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(Icons.replay_rounded),
                  label: const Text('Pesan Layanan Ini Lagi', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PemilihanLokasiScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
