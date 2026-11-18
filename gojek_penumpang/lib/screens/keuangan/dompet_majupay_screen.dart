import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import '../beranda/beranda_penumpang_screen.dart';
import '../beranda/scan_qr_screen.dart';
import '../aktivitas/riwayat_aktivitas_screen.dart';
import '../profil/profil_penumpang_screen.dart';
import 'aktivasi_ovo_paylater_screen.dart';

class DompetMajupayScreen extends StatefulWidget {
  const DompetMajupayScreen({super.key});

  @override
  State<DompetMajupayScreen> createState() => _DompetMajupayScreenState();
}

class _DompetMajupayScreenState extends State<DompetMajupayScreen> {
  final int _currentBottomNavIndex = 2; // Pembayaran tab active

  Widget _buildEwalletCard({
    required String action,
    required String brand,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110,
        height: 120,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  action,
                  style: const TextStyle(
                    fontSize: 11,
                    color: MajuRideTheme.textGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  brand,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: MajuRideTheme.textDark,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: MajuRideTheme.cardBorder),
                ),
                child: const Icon(
                  Icons.add,
                  size: 18,
                  color: MajuRideTheme.textDark,
                ),
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
              // Top Green Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
                decoration: const BoxDecoration(
                  color: MajuRideTheme.primaryGreen,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Keuangan',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.settings_outlined,
                              color: Colors.white, size: 26),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Lebih Hemat, Lebih Mudah dengan\nMajuRide!',
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 3 Overlapping cards row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildEwalletCard(
                          action: 'Aktifkan',
                          brand: 'OVO',
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Hubungkan akun OVO'),
                                backgroundColor: MajuRideTheme.primaryGreen,
                              ),
                            );
                          },
                        ),
                        _buildEwalletCard(
                          action: 'Aktifkan',
                          brand: 'Superbank',
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Buka rekening Superbank'),
                                backgroundColor: MajuRideTheme.primaryGreen,
                              ),
                            );
                          },
                        ),
                        _buildEwalletCard(
                          action: 'Aktifkan',
                          brand: 'OVO\nPayLater',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AktivasiOvoPayLaterScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Scan untuk Bayar Button Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScanQrScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: MajuRideTheme.buttonGrey,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: MajuRideTheme.cardBorder),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.qr_code_scanner_rounded,
                            size: 22, color: MajuRideTheme.textDark),
                        SizedBox(width: 12),
                        Text(
                          'Scan untuk Bayar',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: MajuRideTheme.textDark,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios,
                            size: 14, color: MajuRideTheme.textGrey),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Title: Khusus Buat Pengguna MajuRide
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Khusus Buat Pengguna MajuRide',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: MajuRideTheme.textDark,
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // 3 Square Banner Images (Exact Rectangular / Square, Not Rounded)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSquareBanner('assets/images/banner_danamon.png'),
                    _buildSquareBanner('assets/images/banner_qris.png'),
                    _buildSquareBanner('assets/images/banner_asuransi.png'),
                  ],
                ),
              ),

              const SizedBox(height: 32),
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
            if (index == 0) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const BerandaPenumpangScreen(),
                ),
                (route) => false,
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RiwayatAktivitasScreen(),
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

  Widget _buildSquareBanner(String assetPath) {
    return Container(
      width: 105,
      height: 105,
      decoration: BoxDecoration(
        color: MajuRideTheme.bgLight,
        border: Border.all(color: MajuRideTheme.cardBorder),
      ),
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Center(
          child: Icon(Icons.broken_image, color: MajuRideTheme.textLight),
        ),
      ),
    );
  }
}
