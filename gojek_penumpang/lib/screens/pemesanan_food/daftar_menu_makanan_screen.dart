import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import 'checkout_makanan_screen.dart';

class DaftarMenuMakananScreen extends StatefulWidget {
  const DaftarMenuMakananScreen({super.key});

  @override
  State<DaftarMenuMakananScreen> createState() =>
      _DaftarMenuMakananScreenState();
}

class _DaftarMenuMakananScreenState extends State<DaftarMenuMakananScreen> {
  final List<Map<String, dynamic>> _foodItems = [
    {
      'id': 1,
      'name': 'Mochi - Sp. Line',
      'rating': '4.7 (3K+) . Aceh',
      'priceStr': 'Rp10.000',
      'price': 10000,
      'time': '30mins',
      'image': 'assets/images/food_mochi.png',
      'qty': 0,
    },
    {
      'id': 2,
      'name': 'Dubai chewy - Sp. Line',
      'rating': '4.7 (3K+) . Aceh',
      'priceStr': 'Rp15.000',
      'price': 15000,
      'time': '30mins',
      'image': 'assets/images/food_dubai_chewy.png',
      'qty': 0,
    },
    {
      'id': 3,
      'name': 'Nasi Goreng - Krung Geukeuh',
      'rating': '4.7 (3K+) . Aceh',
      'priceStr': 'Rp15.000',
      'price': 15000,
      'time': '40 mins',
      'image': 'assets/images/food_nasi_goreng.png',
      'qty': 0,
    },
    {
      'id': 4,
      'name': 'Dimsum Narawi - Blang Pulo',
      'rating': '4.7 (3K+) . Aceh',
      'priceStr': 'Rp12.000',
      'price': 12000,
      'time': '25 mins',
      'image': 'assets/images/food_dimsum.png',
      'qty': 0,
    },
  ];

  int get _totalItems =>
      _foodItems.fold(0, (sum, item) => sum + (item['qty'] as int));
  int get _totalPrice => _foodItems.fold(
      0, (sum, item) => sum + ((item['qty'] as int) * (item['price'] as int)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Green Header (Promo Layer Figma Frame)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
              decoration: const BoxDecoration(
                color: MajuRideTheme.primaryGreen,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back & Deliver Now Row
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          } else {
                            Navigator.pushReplacementNamed(context, '/beranda');
                          }
                        },
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'DELIVER NOW',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Row(
                            children: const [
                              Text(
                                'Narawi',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.keyboard_arrow_down,
                                  size: 16, color: Colors.white),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Search input
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search,
                            size: 18, color: MajuRideTheme.textGrey),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'kamu pesan apa nih?',
                            style: TextStyle(
                              fontSize: 13,
                              color: MajuRideTheme.textGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Disc up to 50%
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Disc up to 50%',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF97316),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.local_offer,
                                size: 16, color: Colors.white),
                            SizedBox(width: 4),
                            Text(
                              '%',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
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

            const SizedBox(height: 12),

            // "pengantaran" Pill Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: MajuRideTheme.darkGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'pengantaran',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // "Restoran Popular" Section Box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: MajuRideTheme.primaryGreen,
                    width: 1.5,
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Restoran Popular',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: MajuRideTheme.textDark,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Food List
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 8),
                itemCount: _foodItems.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = _foodItems[index];
                  final qty = item['qty'] as int;

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Square Food Image (No rounded curve, clean square)
                      Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          color: MajuRideTheme.bgLight,
                          border: Border.all(color: MajuRideTheme.cardBorder),
                        ),
                        child: Image.asset(
                          item['image'] as String,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(
                            child: Icon(Icons.fastfood,
                                color: MajuRideTheme.textLight),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),

                      // Food Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'] as String,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: MajuRideTheme.textDark,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              item['rating'] as String,
                              style: const TextStyle(
                                fontSize: 12,
                                color: MajuRideTheme.textGrey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${item['priceStr']} • ${item['time']}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: MajuRideTheme.textDark,
                                  ),
                                ),
                                if (qty == 0)
                                  InkWell(
                                    onTap: () {
                                      setState(() => item['qty'] = 1);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: MajuRideTheme.primaryGreen,
                                        borderRadius:
                                            BorderRadius.circular(6),
                                      ),
                                      child: const Text(
                                        '+ Tambah',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                else
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (item['qty'] > 0) {
                                              item['qty']--;
                                            }
                                          });
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Icon(Icons.remove_circle,
                                              size: 20,
                                              color:
                                                  MajuRideTheme.primaryGreen),
                                        ),
                                      ),
                                      Text(
                                        '$qty',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() => item['qty']++);
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Icon(Icons.add_circle,
                                              size: 20,
                                              color:
                                                  MajuRideTheme.primaryGreen),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Floating Bottom Bar when items added
            if (_totalItems > 0)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(color: MajuRideTheme.cardBorder)),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutMakananScreen(
                            totalPrice: _totalPrice,
                            totalItems: _totalItems,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$_totalItems Menu Dipilih',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Rp ${_totalPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')} ➔',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
