import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';

class PromoDiskonScreen extends StatelessWidget {
  const PromoDiskonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final promos = [
      {
        'title': 'Diskon 50% MajuRide',
        'code': 'MAJURIDEHEMAT',
        'desc': 'Hemat hingga Rp 10.000 untuk perjalanan ojek motor pertama Anda hari ini.',
        'valid': 'Berlaku s/d 31 Des 2026',
        'color': MajuRideTheme.primaryGreen,
      },
      {
        'title': 'Gratis Ongkir MajuFood',
        'code': 'KENYANGHEMAT',
        'desc': 'Potongan ongkir s.d Rp 15.000 di semua restoran mitra bertanda Promo.',
        'valid': 'Berlaku s/d 15 Des 2026',
        'color': const Color(0xFFDC2626),
      },
      {
        'title': 'Cashback 20% MajuPay',
        'code': 'MAJUPAYMANTAP',
        'desc': 'Dapatkan koin cashback hingga 20.000 untuk setiap transaksi via MajuPay.',
        'valid': 'Berlaku setiap hari Jumat',
        'color': const Color(0xFF0284C7),
      },
    ];

    return Scaffold(
      backgroundColor: MajuRideTheme.bgGrey,
      appBar: AppBar(
        backgroundColor: MajuRideTheme.surfaceWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MajuRideTheme.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Promo & Voucher Diskon',
          style: TextStyle(
            color: MajuRideTheme.textDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: promos.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = promos[index];
          final Color badgeColor = item['color'] as Color;
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: MajuRideTheme.surfaceWhite,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: MajuRideTheme.cardBorder),
              boxShadow: MajuRideTheme.cardShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: badgeColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        item['title'] as String,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: badgeColor,
                        ),
                      ),
                    ),
                    Text(
                      item['valid'] as String,
                      style: const TextStyle(fontSize: 11, color: MajuRideTheme.textLight),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  item['desc'] as String,
                  style: const TextStyle(fontSize: 13, color: MajuRideTheme.textGrey, height: 1.3),
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: MajuRideTheme.bgGrey,
                        border: Border.all(color: MajuRideTheme.cardBorder),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        item['code'] as String,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          color: MajuRideTheme.textDark,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MajuRideTheme.primaryGreen,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Voucher ${item['code']} berhasil disalin!'),
                            backgroundColor: MajuRideTheme.primaryGreen,
                          ),
                        );
                      },
                      child: const Text('Gunakan', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
