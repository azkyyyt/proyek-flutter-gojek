import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import '../beranda/beranda_penumpang_screen.dart';

class PembayaranSelesaiScreen extends StatelessWidget {
  final String merchantName;
  final String amount;
  final String serviceType;
  final String orderId;

  const PembayaranSelesaiScreen({
    super.key,
    this.merchantName = 'Rayyan putri',
    this.amount = 'Rp 10.000',
    this.serviceType = 'QRIS',
    this.orderId = 'TRX-WD894211',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Mint Green Checkmark Badge
              Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  color: Color(0xFFD1FAE5),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.check,
                  size: 54,
                  color: MajuRideTheme.primaryGreen,
                ),
              ),
              const SizedBox(height: 24),

              // Title and Subtitle
              const Text(
                'Pembayaran Berhasil!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: MajuRideTheme.textDark,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Dana telah secara instan ditransfer dari rekening\nAnda.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: MajuRideTheme.textGrey,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),

              // Receipt Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: MajuRideTheme.cardBorder),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildRow('ID TRANSAKSI', orderId, isLabelBold: true),
                    const SizedBox(height: 14),
                    _buildRow('Waktu Transfer:', 'Rabu, 7 Okt • 09:45 WIB'),
                    const SizedBox(height: 14),
                    _buildRow('Metode pembayaran:', serviceType),
                    const SizedBox(height: 14),
                    _buildRow('Pemilik Rekening:', merchantName),
                    const Divider(height: 28, color: MajuRideTheme.cardBorder),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nominal Dibayar:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: MajuRideTheme.textDark,
                          ),
                        ),
                        Text(
                          amount,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: MajuRideTheme.primaryGreen,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 3),

              // KEMBALI KE BERANDA Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MajuRideTheme.primaryGreen,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BerandaPenumpangScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'KEMBALI KE BERANDA',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isLabelBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isLabelBold ? FontWeight.bold : FontWeight.normal,
            color: isLabelBold
                ? MajuRideTheme.textLight
                : MajuRideTheme.textGrey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: MajuRideTheme.textDark,
          ),
        ),
      ],
    );
  }
}
