import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import '../beranda/beranda_penumpang_screen.dart';
import '../keuangan/dompet_majupay_screen.dart';
import '../profil/profil_penumpang_screen.dart';

class RiwayatAktivitasScreen extends StatefulWidget {
  const RiwayatAktivitasScreen({super.key});

  @override
  State<RiwayatAktivitasScreen> createState() => _RiwayatAktivitasScreenState();
}

class _RiwayatAktivitasScreenState extends State<RiwayatAktivitasScreen> {
  final int _currentBottomNavIndex = 1; // Aktivitas tab active

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar: "Aktivitas" & "Ekspor transaksi bisnis"
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Aktivitas',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: MajuRideTheme.textDark,
                      letterSpacing: -0.5,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: MajuRideTheme.buttonGrey,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: MajuRideTheme.cardBorder),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.arrow_downward,
                            size: 14, color: MajuRideTheme.textDark),
                        SizedBox(width: 6),
                        Text(
                          'Ekspor transaksi bisnis',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: MajuRideTheme.textDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Center Empty State (Exact Figma Design: bagian aktivitas)
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Document Icon / Graphic
                      Container(
                        width: 100,
                        height: 120,
                        decoration: BoxDecoration(
                          color: MajuRideTheme.buttonGrey,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: MajuRideTheme.cardBorder),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            5,
                            (index) => Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 16),
                              height: 4,
                              decoration: BoxDecoration(
                                color: MajuRideTheme.cardBorder,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      const Text(
                        'Lagi nggak ada apa-apa, nih',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: MajuRideTheme.textDark,
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Di sini kamu bisa lihat layanan yang\nkamu pakai.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: MajuRideTheme.textGrey,
                          height: 1.4,
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
