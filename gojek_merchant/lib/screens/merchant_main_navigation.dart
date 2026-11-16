import 'package:flutter/material.dart';
import '../constants/majuride_merchant_theme.dart';
import 'dashboard/merchant_dashboard_screen.dart';
import 'kelola_menu/merchant_kelola_menu_screen.dart';
import 'pesanan/merchant_penyiapan_pesanan_screen.dart';
import 'profil_toko/merchant_profil_toko_screen.dart';

/// Screen: Main Navigation Bar Mitra Merchant MajuRide
/// Node Figma: 8921:1690 (Bottom Navigation Bar 4 Tabs)
class MerchantMainNavigation extends StatefulWidget {
  final int initialIndex;
  const MerchantMainNavigation({super.key, this.initialIndex = 0});

  @override
  State<MerchantMainNavigation> createState() => _MerchantMainNavigationState();
}

class _MerchantMainNavigationState extends State<MerchantMainNavigation> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  // 4 Tabs sesuai Figma
  final List<Widget> _pages = const [
    MerchantDashboardScreen(),
    MerchantPenyiapanPesananScreen(),
    MerchantKelolaMenuScreen(),
    MerchantProfilTokoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Color(0xFFF1F5F9), width: 1.5),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.home_rounded, 'Beranda'),
                _buildNavItem(1, Icons.storefront_rounded, 'Pesanan Masuk'),
                _buildNavItem(2, Icons.restaurant_rounded, 'Kelola Menu'),
                _buildNavItem(3, Icons.settings_rounded, 'Profil Toko'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected
                  ? MajuRideMerchantTheme.primaryGreen
                  : const Color(0xFF94A3B8),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected
                    ? MajuRideMerchantTheme.primaryGreen
                    : const Color(0xFF94A3B8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
