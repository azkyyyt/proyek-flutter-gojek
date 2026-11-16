import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import 'metode_pembayaran_pesanan_screen.dart';

class PilihanLayananTarifScreen extends StatefulWidget {
  final String pickupLocation;
  final String destinationLocation;

  const PilihanLayananTarifScreen({
    super.key,
    this.pickupLocation = 'Lokasi saat ini',
    this.destinationLocation = 'Komplek TNI-AD RUDAL 001',
  });

  @override
  State<PilihanLayananTarifScreen> createState() =>
      _PilihanLayananTarifScreenState();
}

class _PilihanLayananTarifScreenState extends State<PilihanLayananTarifScreen> {
  int _selectedFleetIndex = 0;

  final List<Map<String, dynamic>> _fleets = [
    {
      'title': 'MajuRide Standard',
      'icon': '🛵',
      'eta': '5 mnt lagi • 👤1',
      'badge': 'MajuRide ⓘ',
      'price': 'Rp12.000',
      'originalPrice': 'Rp16.000',
    },
    {
      'title': 'MajuRide Hemat',
      'icon': '🛵',
      'eta': '3 mnt lagi • 👤1',
      'badge': 'MajuRide',
      'price': 'Rp8.000',
      'originalPrice': 'Rp10.000',
    },
    {
      'title': 'Car Standard',
      'icon': '🚗',
      'eta': '6 mnt lagi • 👤4',
      'badge': '4 kursi',
      'price': 'Rp15.000',
      'originalPrice': 'Rp20.000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Nav Row
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: MajuRideTheme.textDark),
                    onPressed: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pushReplacementNamed(context, '/beranda');
                      }
                    },
                  ),
                  const Spacer(),
                  // Green Pill: "Rute Bijak BBM"
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: MajuRideTheme.primaryGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Rute Bijak BBM',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.5,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 48),
                ],
              ),
            ),

            const Spacer(),

            // Bottom Modal Card (Figma Node 8730:2531)
            Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 16,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Drag Handle
                  Container(
                    width: 44,
                    height: 4,
                    decoration: BoxDecoration(
                      color: MajuRideTheme.cardBorder,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // 3 Service Options
                  ...List.generate(_fleets.length, (index) {
                    final item = _fleets[index];
                    final isSelected = _selectedFleetIndex == index;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedFleetIndex = index),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFF0FDF4)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected
                                ? MajuRideTheme.primaryGreen
                                : MajuRideTheme.cardBorder,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              item['icon'] as String,
                              style: const TextStyle(fontSize: 32),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['title'] as String,
                                    style: const TextStyle(
                                      fontSize: 14.5,
                                      fontWeight: FontWeight.bold,
                                      color: MajuRideTheme.textDark,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    item['eta'] as String,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: MajuRideTheme.textGrey,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: MajuRideTheme.buttonGrey,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      item['badge'] as String,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: MajuRideTheme.textGrey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  item['price'] as String,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: MajuRideTheme.textDark,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  item['originalPrice'] as String,
                                  style: const TextStyle(
                                    fontSize: 11.5,
                                    decoration: TextDecoration.lineThrough,
                                    color: MajuRideTheme.textLight,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 6),

                  // Payment & Promo Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.payments,
                              color: MajuRideTheme.primaryGreen, size: 20),
                          SizedBox(width: 6),
                          Text(
                            'Tunai',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: MajuRideTheme.textDark,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: MajuRideTheme.buttonGrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Promo Penguna Baru',
                          style: TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w600,
                            color: MajuRideTheme.textDark,
                          ),
                        ),
                      ),
                      const Icon(Icons.more_horiz,
                          color: MajuRideTheme.textGrey),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // "Pilih Tujuan Ini" Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MajuRideTheme.primaryGreen,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MetodePembayaranPesananScreen(
                              serviceName:
                                  _fleets[_selectedFleetIndex]['title'],
                              price: _fleets[_selectedFleetIndex]['price'],
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Pilih Tujuan Ini',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
