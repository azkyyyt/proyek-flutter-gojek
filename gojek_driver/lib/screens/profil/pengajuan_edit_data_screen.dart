import 'package:flutter/material.dart';
import '../../constants/majuride_driver_theme.dart';

/// Screen: Pengajuan Perubahan Data Driver (Node 8886:3303)
/// Form perubahan plat nomor, unggah foto STNK, rekening bank, dan kontak darurat driver
class PengajuanEditDataScreen extends StatefulWidget {
  const PengajuanEditDataScreen({super.key});

  @override
  State<PengajuanEditDataScreen> createState() => _PengajuanEditDataScreenState();
}

class _PengajuanEditDataScreenState extends State<PengajuanEditDataScreen> {
  final TextEditingController _platController = TextEditingController(text: 'B 4567 NR');
  final TextEditingController _rekController = TextEditingController(text: '88219481920 (a.n Budi Santoso)');
  final TextEditingController _daruratController = TextEditingController(text: '+62 852-9988-1122 (Istri)');
  String _selectedBank = 'BCA';
  bool _stnkUploaded = false;

  @override
  void dispose() {
    _platController.dispose();
    _rekController.dispose();
    _daruratController.dispose();
    super.dispose();
  }

  void _onBack() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushReplacementNamed('/main_nav');
    }
  }

  void _onSubmit() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pengajuan perubahan data berhasil dikirim untuk diverifikasi tim admin!'),
        backgroundColor: MajuRideDriverTheme.primaryGreen,
      ),
    );
    _onBack();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Center(
            child: InkWell(
              onTap: _onBack,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: Color(0xFFF1F5F9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  size: 18,
                  color: MajuRideDriverTheme.textBlack,
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          'Pengajuan Perubahan Data',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: MajuRideDriverTheme.textBlack,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Warning Notice Box (Node 8886:3303)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF3C7),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFFDE68A)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('⚠️', style: TextStyle(fontSize: 16)),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Perubahan Plat Nomor / Rekening Bank memerlukan verifikasi tim admin NusaRide (1x24 jam) demi keamanan transaksi.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF92400E),
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Field 1: Plat Nomor Kendaraan
              const Text(
                'Plat Nomor Kendaraan',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: MajuRideDriverTheme.textBlack,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: MajuRideDriverTheme.borderGrey),
                ),
                child: TextField(
                  controller: _platController,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: MajuRideDriverTheme.textBlack,
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Field 2: Foto STNK Terbaru
              const Text(
                'Foto STNK Terbaru (Jika Perpanjang)',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: MajuRideDriverTheme.textBlack,
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () {
                  setState(() {
                    _stnkUploaded = !_stnkUploaded;
                  });
                },
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  decoration: BoxDecoration(
                    color: _stnkUploaded ? const Color(0xFFF0FDF4) : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: _stnkUploaded
                          ? MajuRideDriverTheme.primaryGreen
                          : const Color(0xFF6EE7B7),
                      width: 1.5,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        _stnkUploaded ? Icons.check_circle : Icons.image_outlined,
                        size: 32,
                        color: MajuRideDriverTheme.primaryGreen,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _stnkUploaded
                            ? 'STNK_B4567NR_2026.jpg (Terpilih)'
                            : 'Upload Foto STNK (Max 5MB)',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: MajuRideDriverTheme.primaryGreen,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Field 3: Rekening Bank Pencairan Saldo
              const Text(
                'Rekening Bank Pencairan Saldo',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: MajuRideDriverTheme.textBlack,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: ['BCA', 'Mandiri', 'BRI'].map((bank) {
                  final isSelected = _selectedBank == bank;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedBank = bank;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? MajuRideDriverTheme.mintBg : const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? MajuRideDriverTheme.primaryGreen
                                  : MajuRideDriverTheme.borderGrey,
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              bank,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? MajuRideDriverTheme.primaryGreen
                                    : MajuRideDriverTheme.textGrey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 10),

              // Rekening number box
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: MajuRideDriverTheme.borderGrey),
                ),
                child: TextField(
                  controller: _rekController,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: MajuRideDriverTheme.textBlack,
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Field 4: Nomor HP Kontak Darurat
              const Text(
                'Nomor HP Kontak Darurat',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: MajuRideDriverTheme.textBlack,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: MajuRideDriverTheme.borderGrey),
                ),
                child: TextField(
                  controller: _daruratController,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: MajuRideDriverTheme.textBlack,
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Button: KIRIM PENGAJUAN EDIT DATA
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _onSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF008A59),
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.send_rounded, size: 16),
                      SizedBox(width: 8),
                      Text(
                        'KIRIM PENGAJUAN EDIT DATA',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
