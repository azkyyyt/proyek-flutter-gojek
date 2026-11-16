import 'package:flutter/material.dart';
import '../../constants/majuride_merchant_theme.dart';
import 'merchant_edit_harga_modal.dart';

/// Screen: Kelola Menu Resto
/// Figma Node: 8913:2333
class MerchantKelolaMenuScreen extends StatefulWidget {
  const MerchantKelolaMenuScreen({super.key});

  @override
  State<MerchantKelolaMenuScreen> createState() =>
      _MerchantKelolaMenuScreenState();
}

class _MerchantKelolaMenuScreenState extends State<MerchantKelolaMenuScreen> {
  void _onBack() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacementNamed(context, '/main_nav');
    }
  }

  // 5 exact menu items matching Figma 8913:2333
  final List<Map<String, dynamic>> _menuList = [
    {
      'name': 'Ayam Geprek Salero Original',
      'price': 'Rp 18.000',
      'priceInt': 18000,
      'sold': 'Terjual 320+ porsi',
      'available': true,
      'isImage': true,
      'asset': 'assets/images/resto_avatar.png',
    },
    {
      'name': 'Ayam Geprek Keju Lumer',
      'price': 'Rp 22.000',
      'priceInt': 22000,
      'sold': 'Terjual 180+ porsi',
      'available': true,
      'isImage': true,
      'asset': 'assets/images/resto_avatar.png',
    },
    {
      'name': 'Dimsum Narawi (4 Pcs)',
      'price': 'Rp 15.000',
      'priceInt': 15000,
      'sold': 'Terjual 95+ porsi',
      'available': true,
      'isImage': true,
      'asset': 'assets/images/resto_avatar.png',
    },
    {
      'name': 'Es Teh Manis Jumbo',
      'price': 'Rp 5.000',
      'priceInt': 5000,
      'sold': 'Terjual 500+ gelas',
      'available': true,
      'isImage': false,
      'emoji': '🥤',
      'bgColor': const Color(0xFFFEF3C7),
    },
    {
      'name': 'Es Jeruk Peras',
      'price': 'Rp 7.000',
      'priceInt': 7000,
      'sold': 'Terjual 210+ gelas',
      'available': true,
      'isImage': false,
      'emoji': '🍊',
      'bgColor': const Color(0xFFFFEDD5),
    },
  ];

  void _openEditPriceModal(Map<String, dynamic> item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => MerchantEditHargaModal(
        menuName: item['name'] as String,
        currentPrice: item['priceInt'] as int,
        onPriceUpdated: (newPrice) {
          setState(() {
            item['priceInt'] = newPrice;
            item['price'] = 'Rp $newPrice';
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final activeCount = _menuList.where((item) => item['available'] == true).length;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header: Title & "+ Tambah Menu" & Back Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: _onBack,
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          width: 38,
                          height: 38,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF1F5F9),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Color(0xFF0F172A),
                            size: 18,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Kelola Menu Resto',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          const SizedBox(height: 2),
                          RichText(
                            text: TextSpan(
                              text: 'Ayam Geprek Salero • ',
                              style: const TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                fontSize: 11,
                                color: Color(0xFF64748B),
                              ),
                              children: [
                                TextSpan(
                                  text: '$activeCount Menu Aktif',
                                  style: const TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00A86B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/tambah_menu');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MajuRideMerchantTheme.primaryGreen,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    icon: const Icon(Icons.add, size: 16),
                    label: const Text(
                      'Tambah Menu',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Filter Tag: "Semua"
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  decoration: BoxDecoration(
                    color: MajuRideMerchantTheme.primaryGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Semua',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Daftar Menu List (Semua Card Bisa Di-klik untuk Edit Harga / Menu)
              Expanded(
                child: ListView.separated(
                  itemCount: _menuList.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    final item = _menuList[index];
                    final isAvailable = item['available'] as bool;
                    final statusSoldText = isAvailable
                        ? (item['sold'] as String)
                        : 'Stok Habis Hari Ini';

                    return GestureDetector(
                      onTap: () => _openEditPriceModal(item),
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFFE2E8F0),
                          ),
                        ),
                        child: Row(
                          children: [
                            // Thumbnail
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                width: 64,
                                height: 64,
                                child: item['isImage'] == true
                                    ? Image.asset(
                                        item['asset'],
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) => Container(
                                          color: MajuRideMerchantTheme.mintLight,
                                          child: const Icon(
                                            Icons.restaurant_menu_rounded,
                                            color: MajuRideMerchantTheme.primaryGreen,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        color: item['bgColor'] as Color,
                                        alignment: Alignment.center,
                                        child: Text(
                                          item['emoji'] as String,
                                          style: const TextStyle(fontSize: 30),
                                        ),
                                      ),
                              ),
                            ),
                            const SizedBox(width: 12),

                            // Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name'],
                                    style: const TextStyle(
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0F172A),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    item['price'],
                                    style: const TextStyle(
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF00A86B),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    statusSoldText,
                                    style: TextStyle(
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontSize: 11,
                                      color: isAvailable
                                          ? const Color(0xFF94A3B8)
                                          : const Color(0xFFEF4444),
                                      fontWeight: isAvailable
                                          ? FontWeight.normal
                                          : FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Switch & Status
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  isAvailable ? 'TERSEDIA' : 'HABIS',
                                  style: TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                    color: isAvailable
                                        ? const Color(0xFF00A86B)
                                        : const Color(0xFF94A3B8),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Switch(
                                  value: isAvailable,
                                  activeThumbColor: MajuRideMerchantTheme.primaryGreen,
                                  activeTrackColor: const Color(0xFFD1FAE5),
                                  inactiveThumbColor: const Color(0xFFCBD5E1),
                                  inactiveTrackColor: const Color(0xFFF1F5F9),
                                  onChanged: (val) {
                                    setState(() {
                                      item['available'] = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
