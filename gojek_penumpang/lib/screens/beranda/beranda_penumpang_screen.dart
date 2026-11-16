import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import '../pemesanan_food/daftar_menu_makanan_screen.dart';
import '../pemesanan_ride/pemilihan_lokasi_screen.dart';
import '../keuangan/dompet_majupay_screen.dart';
import '../aktivitas/riwayat_aktivitas_screen.dart';
import '../profil/profil_penumpang_screen.dart';
import 'scan_qr_screen.dart';
import 'driver_mobil_screen.dart';

class BerandaPenumpangScreen extends StatefulWidget {
  const BerandaPenumpangScreen({super.key});

  @override
  State<BerandaPenumpangScreen> createState() => _BerandaPenumpangScreenState();
}

class _BerandaPenumpangScreenState extends State<BerandaPenumpangScreen> {
  final int _currentBottomNavIndex = 0;

  final List<Map<String, dynamic>> _restaurants = [
    {
      'title': 'Ayam geprek - Blang Pulo',
      'rating': '4.8',
      'distance': '2,7 km',
      'image': 'assets/images/home_food_ayam_geprek.png',
    },
    {
      'title': 'Risol - Blang Pulo',
      'rating': '4.8',
      'distance': '2,7 km',
      'image': 'assets/images/home_food_risol.png',
    },
    {
      'title': 'Nasi Goreng - Krueng Geukueh',
      'rating': '4.8',
      'distance': '2,3 km',
      'image': 'assets/images/home_food_nasi_goreng.png',
    },
    {
      'title': 'Dimsum Narawi - Blang Pulo',
      'rating': '4.8',
      'distance': '2,7 km',
      'image': 'assets/images/home_food_dimsum.png',
    },
    {
      'title': 'Cimol Kuah Keju - Cunda',
      'rating': '4.8',
      'distance': '2km',
      'image': 'assets/images/home_food_cimol.png',
    },
    {
      'title': 'Mochi - Sp. Line',
      'rating': '4.8',
      'distance': '2,7 km',
      'image': 'assets/images/home_food_mochi.png',
    },
    {
      'title': 'Donat - Sp. Line',
      'rating': '4.8',
      'distance': '1,7 km',
      'image': 'assets/images/home_food_donat.png',
    },
    {
      'title': 'dubai chewy coookie - Sp. Line',
      'rating': '4.8',
      'distance': '7 km',
      'image': 'assets/images/home_food_dubai_chewy.png',
    },
  ];

  Widget _buildServiceButton({
    required String assetPath,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            alignment: Alignment.center,
            child: Image.asset(
              assetPath,
              width: 64,
              height: 64,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.category,
                size: 40,
                color: MajuRideTheme.primaryGreen,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: MajuRideTheme.textDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantCard(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DaftarMenuMakananScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: MajuRideTheme.cardBorder),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Square Food Image (Rectangle 55 in Figma)
            AspectRatio(
              aspectRatio: 1.35,
              child: Image.asset(
                item['image'] as String,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: MajuRideTheme.bgLight,
                  child: const Icon(
                    Icons.fastfood,
                    color: MajuRideTheme.textLight,
                    size: 32,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'] as String,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                      color: MajuRideTheme.textDark,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            item['rating'] as String,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: MajuRideTheme.textDark,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.restaurant,
                              color: MajuRideTheme.textDark, size: 12),
                          const SizedBox(width: 4),
                          Text(
                            item['distance'] as String,
                            style: const TextStyle(
                              fontSize: 11,
                              color: MajuRideTheme.textGrey,
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar (Figma Node 8698:1391)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Row(
                  children: [
                    // Scan QR Button (qr-code-scan 1)
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScanQrScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: MajuRideTheme.cardBorder),
                        ),
                        child: const Icon(
                          Icons.qr_code_scanner,
                          size: 24,
                          color: MajuRideTheme.textDark,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Search Bar with Green Border ("Cari Disini")
                    Expanded(
                      child: Container(
                        height: 44,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: MajuRideTheme.primaryGreen,
                            width: 1.5,
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.search,
                                color: MajuRideTheme.textGrey, size: 20),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Cari Disini',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: MajuRideTheme.textGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    // User Profile Avatar (user)
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ProfilPenumpangScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF10B981),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 3 Main Services Row: Food, Car, Bike (Figma Frame 4)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildServiceButton(
                      assetPath: 'assets/images/icon_service_food.png',
                      title: 'Food',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const DaftarMenuMakananScreen(),
                          ),
                        );
                      },
                    ),
                    _buildServiceButton(
                      assetPath: 'assets/images/icon_service_car.png',
                      title: 'Car',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DriverMobilScreen(),
                          ),
                        );
                      },
                    ),
                    _buildServiceButton(
                      assetPath: 'assets/images/icon_service_bike.png',
                      title: 'Bike',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PemilihanLokasiScreen(initialMode: 'Motor'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 2-Column Food Grid (Figma Group 3 Restaurant Cards)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _restaurants.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.82,
                  ),
                  itemBuilder: (context, index) {
                    return _buildRestaurantCard(_restaurants[index]);
                  },
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: MajuRideTheme.cardBorder, width: 1),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentBottomNavIndex,
          selectedItemColor: MajuRideTheme.textDark,
          unselectedItemColor: MajuRideTheme.textLight,
          selectedLabelStyle: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RiwayatAktivitasScreen(),
                ),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DompetMajupayScreen(),
                ),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilPenumpangScreen(),
                ),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled, size: 22),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_rounded, size: 22),
              label: 'Aktivitas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_rounded, size: 22),
              label: 'Pembayaran',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded, size: 22),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
