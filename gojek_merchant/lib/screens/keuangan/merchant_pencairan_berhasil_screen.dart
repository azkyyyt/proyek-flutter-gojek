import 'package:flutter/material.dart';
import '../../constants/majuride_merchant_theme.dart';
import '../../services/merchant_wallet_service.dart';

/// Screen: Pencairan Berhasil
/// Figma Node: 9017:2787
class MerchantPencairanBerhasilScreen extends StatelessWidget {
  const MerchantPencairanBerhasilScreen({super.key});

  void _onBack(BuildContext context) {
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              // Big Green Checkmark
              Center(
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD1FAE5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    color: Color(0xFF00A86B),
                    size: 44,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Pencairan Dana Berhasil!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Dana telah secara instan ditransfer ke rekening Bank BCA\nAnda.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 13,
                  color: Color(0xFF64748B),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 28),

              // Transaction Detail Card
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  children: [
                    _buildDetailLine('ID TRANSAKSI', 'TRX-WD894210', isHeader: true),
                    const SizedBox(height: 14),
                    const Divider(height: 1, color: Color(0xFFF1F5F9)),
                    const SizedBox(height: 14),
                    _buildDetailLine('Waktu Transfer:', 'Rabu, 7 Okt • 18:45 WIB'),
                    const SizedBox(height: 12),
                    _buildDetailLine('Rekening Tujuan:', 'BCA (88219481920)'),
                    const SizedBox(height: 12),
                    _buildDetailLine('Pemilik Rekening:', 'Andi Saputra'),
                    const SizedBox(height: 14),
                    const Divider(height: 1, color: Color(0xFFF1F5F9)),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nominal Ditarik:',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        Text(
                          'Rp ${MerchantWalletService.formatRupiah(MerchantWalletService().lastNominalDitarik)}',
                          style: const TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF00A86B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Mint Banner: Sisa Saldo
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F9F1),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFB5ECD5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sisa Saldo Dompet Merchant:',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 13,
                        color: Color(0xFF00A86B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rp ${MerchantWalletService.formatRupiah(MerchantWalletService().lastSisaSaldo)}',
                      style: const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF00A86B),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Button Back to Wallet / Dashboard
              ElevatedButton.icon(
                onPressed: () => _onBack(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MajuRideMerchantTheme.primaryGreen,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                icon: const Icon(Icons.credit_card_rounded, size: 20),
                label: const Text(
                  'KEMBALI KE DOMPET MERCHANT',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 13,
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

  Widget _buildDetailLine(String label, String value, {bool isHeader = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: isHeader ? 11 : 13,
            fontWeight: isHeader ? FontWeight.w800 : FontWeight.normal,
            color: isHeader ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
            letterSpacing: isHeader ? 0.5 : 0,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0F172A),
          ),
        ),
      ],
    );
  }
}
