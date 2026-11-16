import 'package:flutter/material.dart';
import '../constants/majuride_driver_theme.dart';
import 'beranda/beranda_driver_screen.dart';
import 'pesanan/riwayat_perjalanan_screen.dart';
import 'dompet/dompet_driver_screen.dart';
import 'profil/profil_driver_screen.dart';

/// Navigation Shell: Menghubungkan 4 tab utama aplikasi driver
/// 1. Beranda (Home Online/Offline & Order)
/// 2. Riwayat (Riwayat Perjalanan & Trip)
/// 3. Dompet (MajuPay Saldo & Pencairan)
/// 4. Profil (Profil Pengemudi & Legalitas)
class DriverMainNavigation extends StatefulWidget {
  final int initialIndex;

  const DriverMainNavigation({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<DriverMainNavigation> createState() => _DriverMainNavigationState();
}

class _DriverMainNavigationState extends State<DriverMainNavigation> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  final List<Widget> _screens = const [
    BerandaDriverScreen(),
    RiwayatPerjalananScreen(),
    DompetDriverScreen(),
    ProfilDriverScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: MajuRideDriverTheme.borderGrey.withValues(alpha: 0.8),
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.home_rounded, 'Beranda'),
                _buildNavItem(1, Icons.bookmark_border_rounded, 'Riwayat'),
                _buildNavItem(2, Icons.account_balance_wallet_outlined, 'Dompet'),
                _buildNavItem(3, Icons.person_outline_rounded, 'Profil'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _currentIndex == index;
    final color = isSelected ? MajuRideDriverTheme.primaryGreen : const Color(0xFF64748B);

    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 22,
              color: color,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
