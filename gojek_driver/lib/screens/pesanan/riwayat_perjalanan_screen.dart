import 'package:flutter/material.dart';
import '../../constants/majuride_driver_theme.dart';
import 'perjalanan_selesai_screen.dart';

/// Screen: Riwayat Perjalanan Driver (Node 8913:1874)
/// Daftar perjalanan yang telah diselesaikan, rincian pendapatan harian, dan rute
class RiwayatPerjalananScreen extends StatelessWidget {
  const RiwayatPerjalananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Riwayat Perjalanan',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: MajuRideDriverTheme.textBlack,
            letterSpacing: -0.3,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: MajuRideDriverTheme.borderGrey),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.calendar_today_outlined, size: 12, color: MajuRideDriverTheme.primaryGreen),
                    SizedBox(width: 4),
                    Text(
                      'Hari Ini (7 Okt)',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: MajuRideDriverTheme.textBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Green Summary Banner
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF008A59),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF008A59).withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Total Pendapatan Hari Ini',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Rp 150.000',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Total Order',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '5 Trip Selesai',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'DAFTAR TRIP SELESAI',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: MajuRideDriverTheme.textGrey,
                letterSpacing: 0.5,
              ),
            ),

            const SizedBox(height: 12),

            // Trip Cards
            _buildTripCard(
              context: context,
              service: 'MajuRide Standard',
              timeAndPassenger: '18:20 WIB • Penumpang: Azkia',
              amount: '+Rp 12.000',
              pickup: 'Jl. Merdeka No. 45',
              dropoff: 'Grand Indonesia Shopping Town',
            ),
            const SizedBox(height: 12),
            _buildTripCard(
              context: context,
              service: 'MajuRide Standard',
              timeAndPassenger: '16:45 WIB • Penumpang: Budi',
              amount: '+Rp 25.000',
              pickup: 'Kantor Sudirman',
              dropoff: 'Mall Taman Anggrek',
            ),
            const SizedBox(height: 12),
            _buildTripCard(
              context: context,
              service: 'MajuRide Standard',
              timeAndPassenger: '14:10 WIB • Penumpang: Dewi',
              amount: '+Rp 15.000',
              pickup: 'Stasiun Tebet',
              dropoff: 'Gedung Cyber 2',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTripCard({
    required BuildContext context,
    required String service,
    required String timeAndPassenger,
    required String amount,
    required String pickup,
    required String dropoff,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const PerjalananSelesaiScreen()),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: MajuRideDriverTheme.borderGrey),
        boxShadow: MajuRideDriverTheme.cardShadow,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: MajuRideDriverTheme.mintLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.electric_moped_rounded,
                  color: MajuRideDriverTheme.primaryGreen,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: MajuRideDriverTheme.textBlack,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      timeAndPassenger,
                      style: const TextStyle(
                        fontSize: 11,
                        color: MajuRideDriverTheme.textGrey,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: MajuRideDriverTheme.primaryGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: MajuRideDriverTheme.primaryGreen,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  pickup,
                  style: const TextStyle(
                    fontSize: 11,
                    color: MajuRideDriverTheme.textBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: Color(0xFFEF4444),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  dropoff,
                  style: const TextStyle(
                    fontSize: 11,
                    color: MajuRideDriverTheme.textGrey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
}
