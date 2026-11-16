import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import 'pilihan_layanan_tarif_screen.dart';
import 'peta_penentuan_lokasi_screen.dart';

class PemilihanLokasiScreen extends StatefulWidget {
  final String initialMode;
  const PemilihanLokasiScreen({super.key, this.initialMode = 'Motor'});

  @override
  State<PemilihanLokasiScreen> createState() => _PemilihanLokasiScreenState();
}

class _PemilihanLokasiScreenState extends State<PemilihanLokasiScreen> {
  final TextEditingController _originController =
      TextEditingController(text: 'Lokasi saat ini');
  final TextEditingController _destController =
      TextEditingController(text: 'Komplek TNI-AD RUDAL 001');

  int _selectedTab = 0; // 0: Terakhir, 1: Disarankan, 2: Tersimpan

  @override
  void dispose() {
    _originController.dispose();
    _destController.dispose();
    super.dispose();
  }

  void _onProceed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PilihanLayananTarifScreen(
          pickupLocation: _originController.text.trim(),
          destinationLocation: _destController.text.trim(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Nav Row
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: MajuRideTheme.textDark),
                    onPressed: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pushReplacementNamed(context, '/beranda');
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.public,
                        color: MajuRideTheme.textDark),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Two Location Input Boxes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  // Origin Field
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: MajuRideTheme.primaryGreen,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Color(0xFF0284C7),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: _originController,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: MajuRideTheme.textDark,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Lokasi saat ini',
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                        const Icon(Icons.camera_alt_outlined,
                            size: 18, color: MajuRideTheme.textGrey),
                        const SizedBox(width: 8),
                        const Icon(Icons.add,
                            size: 20, color: MajuRideTheme.textGrey),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Destination Field
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: MajuRideTheme.primaryGreen,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Color(0xFFEF4444),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: _destController,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: MajuRideTheme.textDark,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Mau ke mana?',
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                        const Icon(Icons.camera_alt_outlined,
                            size: 18, color: MajuRideTheme.textGrey),
                        const SizedBox(width: 8),
                        const Icon(Icons.add,
                            size: 20, color: MajuRideTheme.textGrey),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Tab bar: Terakhir, Disarankan, Tersimpan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  _buildTabItem(0, 'Terakhir'),
                  const SizedBox(width: 20),
                  _buildTabItem(1, 'Disarankan'),
                  const SizedBox(width: 20),
                  _buildTabItem(2, 'Tersimpan'),
                ],
              ),
            ),
            const Divider(height: 1, color: MajuRideTheme.cardBorder),

            // Content List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 16.0),
                children: [
                  // Recent Location item
                  InkWell(
                    onTap: () {
                      setState(() {
                        _destController.text = 'Komplek TNI-AD RUDAL 001';
                      });
                    },
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.access_time,
                            size: 20, color: MajuRideTheme.textGrey),
                        SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Komplek TNI-AD RUDAL 001',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: MajuRideTheme.textDark,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                '3.47km • Lhokseumawe, Jl. Ulee Geudong...',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: MajuRideTheme.textLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Section: Butuh bantuan?
                  const Text(
                    'Butuh bantuan?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: MajuRideTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Help item 1
                  _buildHelpItem(
                    icon: Icons.calendar_today_outlined,
                    text:
                        'Jika kamu belum memutuskan ke mana harus pergi, pilih perjalanan dengan tarif terukur.',
                  ),
                  const SizedBox(height: 14),

                  // Help item 2
                  _buildHelpItem(
                    icon: Icons.near_me_outlined,
                    text:
                        'Salin Kode Plus tempat itu dari Google Maps dan telusuri di sini.',
                  ),
                ],
              ),
            ),

            // Bottom 2 Action Buttons
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MajuRideTheme.primaryGreen,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: _onProceed,
                      child: const Text(
                        'Pilih Tujuan Ini',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                            color: MajuRideTheme.cardBorder, width: 1.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PetaPenentuanLokasiScreen(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.map_rounded,
                              size: 18, color: MajuRideTheme.textDark),
                          SizedBox(width: 8),
                          Text(
                            'Pilih di MajuRideMaps',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: MajuRideTheme.textDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(int index, String label) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected
                  ? MajuRideTheme.primaryGreen
                  : Colors.transparent,
              width: 2.5,
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected
                ? MajuRideTheme.primaryGreen
                : MajuRideTheme.textGrey,
          ),
        ),
      ),
    );
  }

  Widget _buildHelpItem({required IconData icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: MajuRideTheme.primaryGreen),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: MajuRideTheme.textBody,
              height: 1.35,
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.chevron_right, size: 18, color: MajuRideTheme.textLight),
      ],
    );
  }
}
