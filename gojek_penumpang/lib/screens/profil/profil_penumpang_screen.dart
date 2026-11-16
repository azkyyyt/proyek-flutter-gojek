import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import 'edit_profil_screen.dart';
import 'alamat_tersimpan_screen.dart';
import '../keuangan/dompet_majupay_screen.dart';
import '../beranda/beranda_penumpang_screen.dart';
import '../aktivitas/riwayat_aktivitas_screen.dart';
import '../autentikasi/halaman_dashboard_screen.dart';

class ProfilPenumpangScreen extends StatefulWidget {
  const ProfilPenumpangScreen({super.key});

  @override
  State<ProfilPenumpangScreen> createState() => _ProfilPenumpangScreenState();
}

class _ProfilPenumpangScreenState extends State<ProfilPenumpangScreen> {
  final int _currentBottomNavIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row: Profil Saya & Edit Profil (Figma Node 8886:3092)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          } else {
                            Navigator.pushReplacementNamed(context, '/beranda');
                          }
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: MajuRideTheme.buttonGrey,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 18,
                            color: MajuRideTheme.textDark,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Profil Saya',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: MajuRideTheme.textDark,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfilScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: MajuRideTheme.primaryGreen,
                          width: 1.2,
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.edit_outlined,
                              size: 14, color: MajuRideTheme.primaryGreen),
                          SizedBox(width: 6),
                          Text(
                            'Edit Profil',
                            style: TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.bold,
                              color: MajuRideTheme.primaryGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Profile Card (Figma Node 8886:3128)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: MajuRideTheme.cardBorder),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Real Profile Avatar
                    Container(
                      width: 84,
                      height: 84,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        'assets/images/profile_avatar_user.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: const Color(0xFFD1FAE5),
                          alignment: Alignment.center,
                          child: const Text(
                            'AP',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: MajuRideTheme.primaryGreen,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Azkia Akbar Pratama',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: MajuRideTheme.textDark,
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      'azkia.akbar@example.com',
                      style: TextStyle(
                        fontSize: 13,
                        color: MajuRideTheme.textGrey,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Gold Member Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEF3C7).withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFFDE68A)),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('👑', style: TextStyle(fontSize: 13)),
                          SizedBox(width: 6),
                          Text(
                            'Member Gold • 1.250 Poin Rewards',
                            style: TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD97706),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // INFORMASI PRIBADI
              const Text(
                'INFORMASI PRIBADI',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                  color: MajuRideTheme.textGrey,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: MajuRideTheme.cardBorder),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: const BoxDecoration(
                              color: MajuRideTheme.buttonGrey,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.phone,
                                size: 18, color: MajuRideTheme.textDark),
                          ),
                          const SizedBox(width: 14),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nomor Telepon',
                                  style: TextStyle(
                                    fontSize: 11.5,
                                    color: MajuRideTheme.textGrey,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  '+62 812-3456-7890',
                                  style: TextStyle(
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.bold,
                                    color: MajuRideTheme.textDark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD1FAE5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'Terverifikasi',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: MajuRideTheme.primaryGreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: MajuRideTheme.cardBorder),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AlamatTersimpanScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: const BoxDecoration(
                                color: MajuRideTheme.buttonGrey,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.location_on_outlined,
                                  size: 18, color: MajuRideTheme.textDark),
                            ),
                            const SizedBox(width: 14),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Alamat Utama',
                                    style: TextStyle(
                                      fontSize: 11.5,
                                      color: MajuRideTheme.textGrey,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Jl. Merdeka No. 45, Blang Pulo',
                                    style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.bold,
                                      color: MajuRideTheme.textDark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right,
                                size: 18, color: MajuRideTheme.textLight),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // PENGATURAN & KEAMANAN
              const Text(
                'PENGATURAN & KEAMANAN',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                  color: MajuRideTheme.textGrey,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: MajuRideTheme.cardBorder),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.payment,
                          color: MajuRideTheme.primaryGreen, size: 22),
                      title: const Text(
                        'Metode Pembayaran (Maju pay& QRIS)',
                        style: TextStyle(
                            fontSize: 13.5, fontWeight: FontWeight.w600),
                      ),
                      trailing: const Icon(Icons.chevron_right,
                          size: 18, color: MajuRideTheme.textLight),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const DompetMajupayScreen(),
                          ),
                        );
                      },
                    ),
                    const Divider(height: 1, color: MajuRideTheme.cardBorder),
                    const ListTile(
                      leading: Icon(Icons.security,
                          color: Color(0xFF0284C7), size: 22),
                      title: Text(
                        'PIN Keamanan & Biometrik',
                        style: TextStyle(
                            fontSize: 13.5, fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(Icons.chevron_right,
                          size: 18, color: MajuRideTheme.textLight),
                    ),
                    const Divider(height: 1, color: MajuRideTheme.cardBorder),
                    const ListTile(
                      leading: Icon(Icons.notifications_outlined,
                          color: Color(0xFFF59E0B), size: 22),
                      title: Text(
                        'Notifikasi & Promo',
                        style: TextStyle(
                            fontSize: 13.5, fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(Icons.chevron_right,
                          size: 18, color: MajuRideTheme.textLight),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Logout Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: MajuRideTheme.primaryGreen,
                    side: const BorderSide(
                        color: MajuRideTheme.primaryGreen, width: 1.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Konfirmasi Logout'),
                        content: const Text(
                            'Apakah Anda yakin ingin keluar dari akun MajuRide?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: const Text('Batal'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HalamanDashboardScreen(),
                                ),
                                (route) => false,
                              );
                            },
                            child: const Text(
                              'Logout',
                              style: TextStyle(
                                  color: MajuRideTheme.redDanger,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DompetMajupayScreen(),
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
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_rounded, size: 22),
              label: 'Dompet',
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
