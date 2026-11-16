import 'package:flutter/material.dart';
import '../../constants/majuride_merchant_theme.dart';

/// Screen: Penyiapan Pesanan #FOOD-8942
/// Figma Node: 8913:2511
class MerchantPenyiapanPesananScreen extends StatefulWidget {
  const MerchantPenyiapanPesananScreen({super.key});

  @override
  State<MerchantPenyiapanPesananScreen> createState() =>
      _MerchantPenyiapanPesananScreenState();
}

class _MerchantPenyiapanPesananScreenState
    extends State<MerchantPenyiapanPesananScreen> {
  bool _item1 = true;
  bool _item2 = true;
  bool _item3 = true;

  void _onBack() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacementNamed(context, '/main_nav');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Pesanan & Pill Status & Back Button
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: _onBack,
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          width: 38,
                          height: 38,
                          margin: const EdgeInsets.only(right: 12),
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
                        children: const [
                          Text(
                            'Penyiapan Pesanan #FOOD-',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          Text(
                            '8942',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEF3C7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'SEDANG DIMASAK',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFB45309),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Card 1: Estimasi Waktu Memasak
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBEB),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFFDE68A)),
                ),
                child: Column(
                  children: [
                    const Text(
                      'ESTIMASI WAKTU MEMASAK',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFB45309),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '~ 6 Menit Lagi Siap',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF78350F),
                      ),
                    ),
                    const SizedBox(height: 14),
                    // Progress Bar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 8,
                        width: double.infinity,
                        color: const Color(0xFFFDE68A),
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: 0.65,
                          child: Container(
                            color: const Color(0xFFD97706),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Card 2: Checklist Menu & Kemasan (Semua Item Bisa Di-klik)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'CHECKLIST MENU & KEMASAN',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF334155),
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Divider(height: 1, color: Color(0xFFF1F5F9)),
                    const SizedBox(height: 14),
                    _buildInteractiveChecklist(
                      '2x Ayam Geprek Salero (Pedas Lvl 5)',
                      _item1,
                      (val) => setState(() => _item1 = val),
                    ),
                    const SizedBox(height: 14),
                    _buildInteractiveChecklist(
                      '2x Es Teh Manis Jumbo (Sedotan Pisah)',
                      _item2,
                      (val) => setState(() => _item2 = val),
                    ),
                    const SizedBox(height: 14),
                    const Divider(height: 1, color: Color(0xFFF1F5F9)),
                    const SizedBox(height: 14),
                    _buildInteractiveChecklist(
                      'Segel Stiker NusaFood Dipasang 🔒',
                      _item3,
                      (val) => setState(() => _item3 = val),
                      isLock: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Card 3: Driver Penjemput Makanan (Bisa Di-klik)
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Driver Budi Santoso sedang dalam perjalanan menuju resto')),
                  );
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'DRIVER PENJEMPUT MAKANAN',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF94A3B8),
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: MajuRideMerchantTheme.primaryGreen.withValues(alpha: 0.1),
                            backgroundImage: const AssetImage('assets/images/avatar_driver.png'),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Budi Santoso',
                                  style: TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0F172A),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Honda Vario • B 4567 NR',
                                  style: TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 12,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8F9F1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: const Color(0xFFB5ECD5)),
                            ),
                            child: const Text(
                              'Menuju Resto (2 Min)',
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00A86B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // Tombol Bawah: Pesanan Siap Dipikup Driver
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pengantaran_pesanan');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MajuRideMerchantTheme.primaryGreen,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  'PESANAN SIAP DIPIKUP DRIVER',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
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

  Widget _buildInteractiveChecklist(
      String label, bool isChecked, ValueChanged<bool> onChanged,
      {bool isLock = false}) {
    return GestureDetector(
      onTap: () => onChanged(!isChecked),
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                isChecked ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded,
                color: isChecked ? MajuRideMerchantTheme.primaryGreen : const Color(0xFF94A3B8),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isChecked ? const Color(0xFF1E293B) : const Color(0xFF94A3B8),
                ),
              ),
            ],
          ),
          Text(
            isLock ? (isChecked ? 'Tersegel' : 'Belum') : (isChecked ? 'Siap' : 'Menunggu'),
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: isChecked ? const Color(0xFF00A86B) : const Color(0xFF94A3B8),
            ),
          ),
        ],
      ),
    );
  }
}
