import 'package:flutter/material.dart';
import '../../constants/majuride_driver_theme.dart';
import 'pencairan_berhasil_screen.dart';

/// Modal: Masukkan PIN MajuPay / NusaPay (Node 9087:1476 - 9087:1560)
/// Bottom sheet verifikasi 6 digit PIN keamanan transaksi pencairan saldo driver
class InputPinModal extends StatefulWidget {
  final int nominal;
  final String bankName;

  const InputPinModal({
    super.key,
    required this.nominal,
    required this.bankName,
  });

  @override
  State<InputPinModal> createState() => _InputPinModalState();
}

class _InputPinModalState extends State<InputPinModal> {
  String _pin = '';

  void _onKeyPress(String digit) {
    if (_pin.length < 6) {
      setState(() {
        _pin += digit;
      });

      if (_pin.length == 6) {
        // Auto submit
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) {
            Navigator.of(context).pop(); // close modal
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => PencairanBerhasilScreen(
                  nominal: widget.nominal,
                  bankName: widget.bankName,
                ),
              ),
            );
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

  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Masukkan PIN MajuPay',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: MajuRideDriverTheme.textBlack,
                letterSpacing: -0.3,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Konfirmasi otorisasi pencairan saldo Rp ${_formatNumber(widget.nominal)} ke Bank ${widget.bankName}.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: MajuRideDriverTheme.textGrey,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 24),

            // 6 PIN Dots (Node 9087:1566)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                final isFilled = index < _pin.length;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: isFilled ? MajuRideDriverTheme.primaryGreen : Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isFilled
                          ? MajuRideDriverTheme.primaryGreen
                          : const Color(0xFFCBD5E1),
                      width: 2,
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 28),

            // Numeric Keypad
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
                    const SizedBox(width: 72, height: 48), // Empty placeholder
                    _buildKeypadButton('0'),
                    _buildBackspaceButton(),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildKeypadRow(List<String> digits) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: digits.map((d) => _buildKeypadButton(d)).toList(),
    );
  }

  Widget _buildKeypadButton(String digit) {
    return InkWell(
      onTap: () => _onKeyPress(digit),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 72,
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFF1F5F9)),
        ),
        child: Center(
          child: Text(
            digit,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: MajuRideDriverTheme.textBlack,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return InkWell(
      onTap: _onBackspace,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 72,
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFF1F5F9)),
        ),
        child: const Center(
          child: Icon(
            Icons.backspace_outlined,
            size: 20,
            color: MajuRideDriverTheme.textBlack,
          ),
        ),
      ),
    );
  }
}
