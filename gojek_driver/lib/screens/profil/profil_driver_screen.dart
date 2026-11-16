import 'package:flutter/material.dart';
import '../../constants/majuride_driver_theme.dart';
import 'pengajuan_edit_data_screen.dart';
import '../autentikasi/welcome_onboarding_screen.dart';

/// Screen: Profil Pengemudi Driver (Node 8886:3201)
/// Tampilan data profil driver, status verifikasi, data kendaraan aktif, dan kelengkapan dokumen legal
class ProfilDriverScreen extends StatelessWidget {
  const ProfilDriverScreen({super.key});

  void _onLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Konfirmasi Logout'),
        content: const Text('Apakah Anda yakin ingin keluar dari akun driver ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const WelcomeOnboardingScreen()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
              foregroundColor: Colors.white,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profil Pengemudi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: MajuRideDriverTheme.textBlack,
            letterSpacing: -0.3,
          ),
        ),
        actions: [
          // Edit Data Button (Node 8886:3201)
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const PengajuanEditDataScreen()),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF86EFAC)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.edit_note_rounded, size: 14, color: MajuRideDriverTheme.primaryGreen),
                    SizedBox(width: 4),
                    Text(
                      'Edit Data',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: MajuRideDriverTheme.primaryGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),

          // Logout Button (Node 8886:3201)
          Center(
            child: GestureDetector(
              onTap: () => _onLogout(context),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF86EFAC)),
                ),
                child: const Text(
                  'logout',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: MajuRideDriverTheme.primaryGreen,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card 1: Driver Profile Info
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: MajuRideDriverTheme.borderGrey),
                boxShadow: MajuRideDriverTheme.cardShadow,
              ),
              child: Row(
                children: [
                  // Avatar with VERIFIED pill
                  Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: MajuRideDriverTheme.mintBg,
                        backgroundImage: const AssetImage('assets/images/avatar_driver.png'),
                        onBackgroundImageError: (_, _) {},
                      ),
                      Positioned(
                        bottom: -6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFF008A59),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'VERIFIED',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Budi Santoso',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: MajuRideDriverTheme.textBlack,
                          ),
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          'ID Driver: DRV-89421',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: MajuRideDriverTheme.textGrey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: const [
                            Icon(Icons.star, size: 14, color: Color(0xFFF59E0B)),
                            SizedBox(width: 3),
                            Text(
                              '4.9',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: MajuRideDriverTheme.textBlack,
                              ),
                            ),
                            SizedBox(width: 6),
                            Text(
                              '• 1.250+ Trip Selesai',
                              style: TextStyle(
                                fontSize: 11,
                                color: MajuRideDriverTheme.textGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Card 2: KENDARAAN AKTIF
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: MajuRideDriverTheme.borderGrey),
                boxShadow: MajuRideDriverTheme.cardShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'KENDARAAN AKTIF',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: MajuRideDriverTheme.textGrey,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: MajuRideDriverTheme.borderGrey),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: const BoxDecoration(
                            color: MajuRideDriverTheme.mintLight,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.two_wheeler_rounded,
                            color: MajuRideDriverTheme.primaryGreen,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Honda Vario 125 (Hitam)',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                  color: MajuRideDriverTheme.textBlack,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Plat Nomor: B 4567 NR',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: MajuRideDriverTheme.textGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: MajuRideDriverTheme.mintBg,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'STNK Aktif',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: MajuRideDriverTheme.primaryGreen,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Card 3: KELENGKAPAN DOKUMEN (LEGAL)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: MajuRideDriverTheme.borderGrey),
                boxShadow: MajuRideDriverTheme.cardShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'KELENGKAPAN DOKUMEN (LEGAL)',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: MajuRideDriverTheme.textGrey,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Row 1: SIM C
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'SIM C (Pengemudi)',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: MajuRideDriverTheme.textBlack,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.check_circle_rounded, size: 16, color: MajuRideDriverTheme.primaryGreen),
                          SizedBox(width: 4),
                          Text(
                            'Terverifikasi',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: MajuRideDriverTheme.primaryGreen,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  const Divider(height: 1, color: Color(0xFFF1F5F9)),
                  const SizedBox(height: 12),

                  // Row 2: SKCK
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'SKCK Kepolisian',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: MajuRideDriverTheme.textBlack,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.check_circle_rounded, size: 16, color: MajuRideDriverTheme.primaryGreen),
                          SizedBox(width: 4),
                          Text(
                            'Terverifikasi',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: MajuRideDriverTheme.primaryGreen,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  const Divider(height: 1, color: Color(0xFFF1F5F9)),
                  const SizedBox(height: 12),

                  // Row 3: Rekening Bank
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Rekening Bank Pencairan',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: MajuRideDriverTheme.textBlack,
                        ),
                      ),
                      Text(
                        'BCA • **** 8821',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: MajuRideDriverTheme.textBlack,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
