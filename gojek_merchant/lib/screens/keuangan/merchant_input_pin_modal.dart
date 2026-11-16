import 'package:flutter/material.dart';
import '../../constants/majuride_merchant_theme.dart';

/// Modal / Bottom Sheet: Masukkan PIN Keamanan Transaksi Merchant
/// Node Figma: 9017:2568 - 9017:3054
class MerchantInputPinModal extends StatefulWidget {
  final VoidCallback? onSuccess;
  const MerchantInputPinModal({super.key, this.onSuccess});

  @override
  State<MerchantInputPinModal> createState() => _MerchantInputPinModalState();
}

class _MerchantInputPinModalState extends State<MerchantInputPinModal> {
  String _pin = '';

  void _onKeyPress(String val) {
    if (_pin.length < 6) {
      setState(() {
        _pin += val;
      });
      if (_pin.length == 6) {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) {
            Navigator.pop(context); // Close PIN modal
            if (widget.onSuccess != null) {
              widget.onSuccess!();
            } else {
              Navigator.pushNamed(context, '/pencairan_berhasil');
            }
          }
        });
      }
    }
  }

  void _onBackspace() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin = _pin.substring(0, _pin.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Masukkan PIN Keamanan',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: MajuRideMerchantTheme.textBlack,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Konfirmasi penarikan saldo toko Anda',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 13,
                color: MajuRideMerchantTheme.textGrey,
              ),
            ),
            const SizedBox(height: 24),

            // PIN Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                final isFilled = index < _pin.length;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: isFilled
                        ? MajuRideMerchantTheme.primaryGreen
                        : const Color(0xFFE2E8F0),
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            const SizedBox(height: 28),

            // Keypad Numbers
            Column(
              children: [
                _buildKeypadRow(['1', '2', '3']),
                const SizedBox(height: 12),
                _buildKeypadRow(['4', '5', '6']),
                const SizedBox(height: 12),
                _buildKeypadRow(['7', '8', '9']),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 72, height: 56), // Blank placeholder
                    _buildKeypadButton('0'),
                    SizedBox(
                      width: 72,
                      height: 56,
                      child: IconButton(
                        icon: const Icon(Icons.backspace_outlined, size: 22),
                        onPressed: _onBackspace,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildKeypadRow(List<String> values) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: values.map((val) => _buildKeypadButton(val)).toList(),
    );
  }

  Widget _buildKeypadButton(String text) {
    return InkWell(
      onTap: () => _onKeyPress(text),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 72,
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: MajuRideMerchantTheme.borderGrey),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: MajuRideMerchantTheme.textBlack,
            ),
          ),
        ),
      ),
    );
  }
}
