import 'package:flutter/material.dart';
import '../../constants/majuride_merchant_theme.dart';
import '../../services/merchant_wallet_service.dart';
import 'merchant_input_pin_modal.dart';

/// Screen: Cairkan Saldo
/// Figma Node: 9017:2585
class MerchantCairkanSaldoScreen extends StatefulWidget {
  const MerchantCairkanSaldoScreen({super.key});

  @override
  State<MerchantCairkanSaldoScreen> createState() =>
      _MerchantCairkanSaldoScreenState();
}

class _MerchantCairkanSaldoScreenState
    extends State<MerchantCairkanSaldoScreen> {
  int _selectedChip = 2; // Default 200k
  late final TextEditingController _amountCtrl;
  final MerchantWalletService _walletService = MerchantWalletService();

  @override
  void initState() {
    super.initState();
    // Inisialisasi default nominal sesuai saldo yang ada
    final initialNominal = _walletService.saldo >= 200000
        ? 200000
        : (_walletService.saldo >= 100000 ? 100000 : _walletService.saldo);
    _amountCtrl = TextEditingController(
      text: MerchantWalletService.formatRupiah(initialNominal),
    );
    _amountCtrl.addListener(_onAmountChanged);
  }

  void _onAmountChanged() {
    setState(() {
      // Periksa apakah teks cocok dengan salah satu chip preset
      final current = MerchantWalletService.parseNominal(_amountCtrl.text);
      if (current == 50000) {
        _selectedChip = 0;
      } else if (current == 100000) {
        _selectedChip = 1;
      } else if (current == 200000) {
        _selectedChip = 2;
      } else if (current == _walletService.saldo && current > 0) {
        _selectedChip = 3;
      } else {
        _selectedChip = -1; // Kustom
      }
    });
  }

  void _onBack() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacementNamed(context, '/main_nav');
    }
  }

  void _openPinModal() {
    final nominal = MerchantWalletService.parseNominal(_amountCtrl.text);
    if (nominal <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan masukkan nominal pencairan yang valid'),
          backgroundColor: Color(0xFFEF4444),
        ),
      );
      return;
    }

    if (nominal > _walletService.saldo) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Nominal melebihi saldo tersedia (Maksimal Rp ${MerchantWalletService.formatRupiah(_walletService.saldo)})',
          ),
          backgroundColor: const Color(0xFFEF4444),
        ),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => MerchantInputPinModal(
        onSuccess: () {
          // Kurangi saldo secara realtime
          _walletService.withdraw(nominal);
          Navigator.pushReplacementNamed(context, '/pencairan_berhasil');
        },
      ),
    );
  }

  @override
  void dispose() {
    _amountCtrl.removeListener(_onAmountChanged);
    _amountCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final availableSaldo = _walletService.saldo;
    final nominalDitarik = MerchantWalletService.parseNominal(_amountCtrl.text);
    final sisaSaldo = (availableSaldo - nominalDitarik) >= 0
        ? (availableSaldo - nominalDitarik)
        : 0;
    final isOverLimit = nominalDitarik > availableSaldo;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Bar
              Row(
                children: [
                  GestureDetector(
                    onTap: _onBack,
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF1F5F9),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xFF0F172A),
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    'Cairkan Saldo',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Card: Rekening Tujuan Pencairan (BCA)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF005BAC),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'BCA',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bank Central Asia (BCA)',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '88219481920 • Andi Saputra',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontSize: 12,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Rekening BCA telah terverifikasi')),
                        );
                      },
                      child: const Text(
                        'Ubah',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00A86B),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Mint Banner: Saldo Dompet Tersedia (Dinamis dari Wallet Service)
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
                      'Saldo Dompet Tersedia:',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 13,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      'Rp ${MerchantWalletService.formatRupiah(availableSaldo)}',
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
              const SizedBox(height: 20),

              // Input: Masukkan Nominal Pencairan
              const Text(
                'Masukkan Nominal Pencairan (Rp)',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isOverLimit ? const Color(0xFFEF4444) : const Color(0xFF00A86B),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    const Text(
                      'Rp  ',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _amountCtrl,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: isOverLimit ? const Color(0xFFEF4444) : const Color(0xFF0F172A),
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // 4 Chips Pilihan Nominal (Semua Interaktif & Dinamis)
              Row(
                children: [
                  _buildNominalChip(0, 'Rp 50k', '50.000'),
                  const SizedBox(width: 8),
                  _buildNominalChip(1, 'Rp 100k', '100.000'),
                  const SizedBox(width: 8),
                  _buildNominalChip(2, 'Rp 200k', '200.000'),
                  const SizedBox(width: 8),
                  _buildNominalChip(3, 'Semua', MerchantWalletService.formatRupiah(availableSaldo)),
                ],
              ),
              const SizedBox(height: 24),

              // Summary Box: Rincian Pencairan Realtime
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isOverLimit ? const Color(0xFFFCA5A5) : const Color(0xFFE2E8F0),
                  ),
                ),
                child: Column(
                  children: [
                    _buildSummaryLine(
                      'Nominal Ditarik:',
                      'Rp ${MerchantWalletService.formatRupiah(nominalDitarik)}',
                    ),
                    const SizedBox(height: 10),
                    _buildSummaryLine(
                      'Biaya Transfer Bank:',
                      'GRATIS (Promo MajuRide)',
                      valueColor: const Color(0xFF00A86B),
                      boldVal: true,
                    ),
                    const SizedBox(height: 12),
                    const Divider(height: 1, color: Color(0xFFF1F5F9)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Masuk Rekening:',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        Text(
                          'Rp ${MerchantWalletService.formatRupiah(nominalDitarik)}',
                          style: const TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF00A86B),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildSummaryLine(
                      'Sisa Saldo Dompet:',
                      'Rp ${MerchantWalletService.formatRupiah(sisaSaldo)}',
                      valueColor: isOverLimit ? const Color(0xFFEF4444) : const Color(0xFF00A86B),
                      textColor: const Color(0xFF64748B),
                      boldVal: true,
                    ),
                    if (isOverLimit) ...[
                      const SizedBox(height: 8),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '⚠️ Saldo tidak mencukupi untuk nominal ini',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFEF4444),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              const Spacer(),

              // Submit Button -> Membuka Modal PIN Keamanan
              ElevatedButton.icon(
                onPressed: _openPinModal,
                style: ElevatedButton.styleFrom(
                  backgroundColor: MajuRideMerchantTheme.primaryGreen,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                icon: const Icon(Icons.lock_rounded, size: 18),
                label: const Text(
                  'CAIRKAN DANA SEKARANG',
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

  Widget _buildNominalChip(int index, String label, String value) {
    final isSelected = _selectedChip == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedChip = index;
            _amountCtrl.text = value;
          });
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? MajuRideMerchantTheme.primaryGreen : const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : const Color(0xFF334155),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryLine(String label, String value,
      {Color? valueColor, Color? textColor, bool boldVal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 12,
            color: textColor ?? const Color(0xFF64748B),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 12,
            fontWeight: boldVal ? FontWeight.w800 : FontWeight.w600,
            color: valueColor ?? const Color(0xFF1E293B),
          ),
        ),
      ],
    );
  }
}
