import 'package:flutter/material.dart';
import '../../constants/majuride_driver_theme.dart';
import '../driver_main_navigation.dart';

/// Screen: Konfirmasi Pencairan Saldo Berhasil (Node 8913:2265)
/// Bukti transaksi penarikan dana sukses ke rekening bank driver
class PencairanBerhasilScreen extends StatelessWidget {
  final int nominal;
  final String bankName;

  const PencairanBerhasilScreen({
    super.key,
    this.nominal = 200000,
    this.bankName = 'BCA',
  });

  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 36),

              // Green check circle
              Container(
                width: 68,
                height: 68,
                decoration: const BoxDecoration(
                  color: MajuRideDriverTheme.mintLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: MajuRideDriverTheme.primaryGreen,
                  size: 38,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Pencairan Dana Berhasil!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: MajuRideDriverTheme.textBlack,
                  letterSpacing: -0.3,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Dana telah secara instan ditransfer ke rekening Bank $bankName Anda.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  color: MajuRideDriverTheme.textGrey,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 32),

              // Receipt Card (Node 8913:2265)
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: MajuRideDriverTheme.borderGrey),
                  boxShadow: MajuRideDriverTheme.cardShadow,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'ID TRANSAKSI',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: MajuRideDriverTheme.textGrey,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(
                          'TRX-WD894210',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: MajuRideDriverTheme.textBlack,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Waktu Transfer:',
                          style: TextStyle(fontSize: 12, color: MajuRideDriverTheme.textGrey),
                        ),
                        Text(
                          'Rabu, 7 Okt • 18:45 WIB',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: MajuRideDriverTheme.textBlack,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Rekening Tujuan:',
                          style: TextStyle(fontSize: 12, color: MajuRideDriverTheme.textGrey),
                        ),
                        Text(
                          '$bankName (88219481920)',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: MajuRideDriverTheme.textBlack,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Pemilik Rekening:',
                          style: TextStyle(fontSize: 12, color: MajuRideDriverTheme.textGrey),
                        ),
                        Text(
                          'Budi Santoso',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: MajuRideDriverTheme.textBlack,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Divider(height: 1, color: Color(0xFFF1F5F9)),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nominal Ditarik:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: MajuRideDriverTheme.textBlack,
                          ),
                        ),
                        Text(
                          'Rp ${_formatNumber(nominal)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: MajuRideDriverTheme.primaryGreen,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Sisa Saldo Dompet Driver
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FDF4),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFBBF7D0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Sisa Saldo Dompet Driver:',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: MajuRideDriverTheme.primaryGreen,
                      ),
                    ),
                    Text(
                      'Rp 56.000',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: MajuRideDriverTheme.primaryGreen,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Button: KEMBALI KE DOMPET DRIVER
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (_) => const DriverMainNavigation(initialIndex: 2),
                      ),
                      (route) => false,
                    );
                  },
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
                      Icon(Icons.account_balance_wallet_outlined, size: 18),
                      SizedBox(width: 8),
                      Text(
                        'KEMBALI KE DOMPET DRIVER',
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
