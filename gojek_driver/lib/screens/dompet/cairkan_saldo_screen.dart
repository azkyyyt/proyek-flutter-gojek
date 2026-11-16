import 'package:flutter/material.dart';
import '../../constants/majuride_driver_theme.dart';
import 'input_pin_modal.dart';

/// Screen: Form Pencairan Saldo Driver (Node 8913:2044)
/// Pemilihan rekening bank tujuan, pemilihan nominal penarikan, dan kalkulasi biaya transfer
class CairkanSaldoScreen extends StatefulWidget {
  const CairkanSaldoScreen({super.key});

  @override
  State<CairkanSaldoScreen> createState() => _CairkanSaldoScreenState();
}

class _CairkanSaldoScreenState extends State<CairkanSaldoScreen> {
  int _selectedAmount = 200000;
  final int _totalSaldo = 256000;
  String _selectedBank = 'BCA';
  final TextEditingController _amountController = TextEditingController(text: '200.000');

  final List<int> _quickChips = [50000, 100000, 200000];

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _selectAmount(int amount) {
    setState(() {
      _selectedAmount = amount;
      _amountController.text = _formatNumber(amount);
    });
  }

  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        );
  }

  void _onBack() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushReplacementNamed('/main_nav');
    }
  }

  void _onCairkanSekarang() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => InputPinModal(
        nominal: _selectedAmount,
        bankName: _selectedBank,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int sisaSaldo = _totalSaldo - _selectedAmount;

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
          'Cairkan Saldo Driver',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: MajuRideDriverTheme.textBlack,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card 1: Rekening Tujuan Pencairan
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: MajuRideDriverTheme.borderGrey),
                  boxShadow: MajuRideDriverTheme.cardShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'REKENING TUJUAN PENCAIRAN',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: MajuRideDriverTheme.textGrey,
                            letterSpacing: 0.5,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectedBank == 'BCA') {
                                _selectedBank = 'Mandiri';
                              } else if (_selectedBank == 'Mandiri') {
                                _selectedBank = 'BRI';
                              } else {
                                _selectedBank = 'BCA';
                              }
                            });
                          },
                          child: const Text(
                            'Ubah',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: MajuRideDriverTheme.primaryGreen,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 44,
                          height: 34,
                          decoration: BoxDecoration(
                            color: _selectedBank == 'BCA'
                                ? const Color(0xFF005696)
                                : (_selectedBank == 'Mandiri'
                                    ? const Color(0xFF003868)
                                    : const Color(0xFF00529C)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              _selectedBank,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bank Central Asia ($_selectedBank)',
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: MajuRideDriverTheme.textBlack,
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                '88219481920 • Budi Santoso',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: MajuRideDriverTheme.textGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Card 2: Saldo Dompet Tersedia
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FDF4),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFBBF7D0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Saldo Dompet Tersedia:',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: MajuRideDriverTheme.textBlack,
                      ),
                    ),
                    Text(
                      'Rp ${_formatNumber(_totalSaldo)}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: MajuRideDriverTheme.primaryGreen,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Masukkan Nominal Pencairan (Rp)',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: MajuRideDriverTheme.textBlack,
                ),
              ),

              const SizedBox(height: 8),

              // Nominal Input Box
              Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: MajuRideDriverTheme.primaryGreen,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    const Text(
                      'Rp',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: MajuRideDriverTheme.textGrey,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: MajuRideDriverTheme.textBlack,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                        ),
                        onChanged: (val) {
                          final clean = val.replaceAll('.', '');
                          final parsed = int.tryParse(clean) ?? 0;
                          setState(() {
                            _selectedAmount = parsed;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Quick Chips
              Row(
                children: [
                  ..._quickChips.map((chip) {
                    final isSelected = _selectedAmount == chip;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () => _selectAmount(chip),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFF008A59) : const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Rp ${chip ~/ 1000}k',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: isSelected ? Colors.white : MajuRideDriverTheme.textBlack,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  GestureDetector(
                    onTap: () => _selectAmount(_totalSaldo),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: _selectedAmount == _totalSaldo
                            ? const Color(0xFF008A59)
                            : const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Semua',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: _selectedAmount == _totalSaldo
                              ? Colors.white
                              : MajuRideDriverTheme.textBlack,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Card 3: Summary details
              Container(
                padding: const EdgeInsets.all(16),
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
                      children: [
                        const Text(
                          'Nominal Ditarik:',
                          style: TextStyle(
                            fontSize: 13,
                            color: MajuRideDriverTheme.textGrey,
                          ),
                        ),
                        Text(
                          'Rp ${_formatNumber(_selectedAmount)}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
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
                          'Biaya Transfer Bank:',
                          style: TextStyle(
                            fontSize: 13,
                            color: MajuRideDriverTheme.textGrey,
                          ),
                        ),
                        Text(
                          'GRATIS (Promo MajuRide)',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: MajuRideDriverTheme.primaryGreen,
                          ),
                        ),
                      ],
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
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: MajuRideDriverTheme.textBlack,
                          ),
                        ),
                        Text(
                          'Rp ${_formatNumber(_selectedAmount)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: MajuRideDriverTheme.primaryGreen,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sisa Saldo Dompet:',
                          style: TextStyle(
                            fontSize: 12,
                            color: MajuRideDriverTheme.textGrey,
                          ),
                        ),
                        Text(
                          'Rp ${_formatNumber(sisaSaldo >= 0 ? sisaSaldo : 0)}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: MajuRideDriverTheme.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Button: CAIRKAN DANA SEKARANG
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _onCairkanSekarang,
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
                      Icon(Icons.lock_outline_rounded, size: 16),
                      SizedBox(width: 6),
                      Text(
                        'CAIRKAN DANA SEKARANG',
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

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
