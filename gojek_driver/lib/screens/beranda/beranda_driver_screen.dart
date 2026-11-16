import 'package:flutter/material.dart';
import '../../constants/majuride_driver_theme.dart';
import '../pesanan/pesanan_masuk_modal.dart';
import '../profil/profil_driver_screen.dart';
import '../dompet/dompet_driver_screen.dart';

/// Screen: Beranda Driver (Node 8839:2008 Online & 8839:2062 Offline)
/// Tampilan utama driver dengan status online/offline, statistik harian,
/// peta hotspot pesanan ramai, dan aksi penerimaan orderan
class BerandaDriverScreen extends StatefulWidget {
  const BerandaDriverScreen({super.key});

  @override
  State<BerandaDriverScreen> createState() => _BerandaDriverScreenState();
}

class _BerandaDriverScreenState extends State<BerandaDriverScreen> {
  bool _isOnline = true;

  void _showPesananMasuk() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => const PesananMasukModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Top Driver Profile Card
              Container(
                padding: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: MajuRideDriverTheme.cardShadow,
                  border: Border.all(color: MajuRideDriverTheme.borderGrey),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const ProfilDriverScreen()),
                        );
                      },
                      borderRadius: BorderRadius.circular(24),
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: MajuRideDriverTheme.mintBg,
                        backgroundImage: const AssetImage('assets/images/avatar_driver.png'),
                        onBackgroundImageError: (_, _) {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Driver info
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const ProfilDriverScreen()),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Budi Santoso',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: MajuRideDriverTheme.textBlack,
                              ),
                            ),
                            const SizedBox(height: 3),
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
                                  '• Honda Vario B 4567 NR',
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
                    ),
                    // Saldo Dompet
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const DompetDriverScreen()),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Saldo Dompet',
                            style: TextStyle(
                              fontSize: 11,
                              color: MajuRideDriverTheme.textGrey,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Rp 245.000',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: MajuRideDriverTheme.primaryGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // 2. Status Banner (Online / Offline Toggle)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: _isOnline ? MajuRideDriverTheme.primaryGreen : const Color(0xFF0F766E),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: (_isOnline ? MajuRideDriverTheme.primaryGreen : Colors.black).withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _isOnline ? 'ANDA SEDANG ONLINE' : 'ANDA SEDANG OFFLINE',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: 0.3,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _isOnline
                                ? 'Siap menerima pesanan di sekitar Anda'
                                : 'pesanan di sekitar Anda menunggu untuk di antar',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white.withValues(alpha: 0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Switch
                    Transform.scale(
                      scale: 0.85,
                      child: Switch(
                        value: _isOnline,
                        activeThumbColor: Colors.white,
                        activeTrackColor: const Color(0xFF6EE7B7),
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.white.withValues(alpha: 0.4),
                        onChanged: (val) {
                          setState(() {
                            _isOnline = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // 3. Pendapatan Hari Ini Card
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: MajuRideDriverTheme.cardShadow,
                  border: Border.all(color: MajuRideDriverTheme.borderGrey),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Pendapatan Hari Ini',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: MajuRideDriverTheme.textBlack,
                          ),
                        ),
                        Text(
                          'Rabu, 7 Okt',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: MajuRideDriverTheme.primaryGreen,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        _buildStatBox('Total Gaji', 'Rp 150k'),
                        const SizedBox(width: 10),
                        _buildStatBox('Total Trip', '5 Trip'),
                        const SizedBox(width: 10),
                        _buildStatBox('Jam Narik', '4.2 Jam'),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // 4. Map Hotspot Section
              Container(
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: MajuRideDriverTheme.borderGrey),
                  boxShadow: MajuRideDriverTheme.cardShadow,
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    // Map background image
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/map_navigation.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: const Color(0xFFE2E8F0),
                          child: const Center(
                            child: Icon(Icons.map, size: 64, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),

                    // Radar pulse effect in center
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFEF4444).withValues(alpha: 0.18),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFEF4444).withValues(alpha: 0.35),
                            ),
                          ),
                          Container(
                            width: 18,
                            height: 18,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF1E293B),
                            ),
                            child: const Center(
                              child: Icon(Icons.two_wheeler, size: 12, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Top Floating Banner: Area Ramai Pesanan
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text('🔥', style: TextStyle(fontSize: 12)),
                            SizedBox(width: 4),
                            Text(
                              'Area Ramai Pesanan (Blang Pulo / Sudirman)',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: MajuRideDriverTheme.textBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 5. Main Action Button: AYOO NARIKKKKK
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: _showPesananMasuk,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF008A59),
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shadowColor: const Color(0xFF008A59).withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'AYOO NARIKKKKK',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatBox(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFF1F5F9)),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: MajuRideDriverTheme.textGrey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: MajuRideDriverTheme.textBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
