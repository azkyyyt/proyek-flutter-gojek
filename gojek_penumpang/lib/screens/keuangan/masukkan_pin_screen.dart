import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import 'pembayaran_selesai_screen.dart';

class MasukkanPinScreen extends StatefulWidget {
  final String purpose;
  const MasukkanPinScreen({super.key, this.purpose = 'Konfirmasi Transaksi'});

  @override
  State<MasukkanPinScreen> createState() => _MasukkanPinScreenState();
}

class _MasukkanPinScreenState extends State<MasukkanPinScreen> {
  String _pin = '';

  void _onKeyPress(String digit) {
    if (_pin.length < 6) {
      setState(() {
        _pin += digit;
      });
      if (_pin.length == 6) {
        _verifyPin();
      }
    }
  }

  void _onDelete() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin = _pin.substring(0, _pin.length - 1);
      });
    }
  }

  void _verifyPin() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const PembayaranSelesaiScreen(
            merchantName: 'MajuPay Saldo',
            amount: 'Rp 50.000',
            serviceType: 'Transaksi Berhasil Diotorisasi',
          ),
        ),
      );
    });
  }

  Widget _buildKeypadButton(String text, {VoidCallback? onTap}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap ?? () => _onKeyPress(text),
          child: Container(
            height: 54,
            decoration: BoxDecoration(
              color: MajuRideTheme.surfaceWhite,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: MajuRideTheme.cardBorder),
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: MajuRideTheme.textDark,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MajuRideTheme.bgGrey,
      appBar: AppBar(
        backgroundColor: MajuRideTheme.surfaceWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MajuRideTheme.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Keamanan MajuPay',
          style: TextStyle(
            color: MajuRideTheme.textDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 28),
            Text(
              widget.purpose,
              style: const TextStyle(fontSize: 14, color: MajuRideTheme.textGrey),
            ),
            const SizedBox(height: 8),
            const Text(
              'Masukkan PIN MajuPay Anda',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: MajuRideTheme.textDark),
            ),
            const SizedBox(height: 32),

            // 6 PIN Dots (Interaktif & Dinamis dalam 1 Layar!)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                final bool isFilled = index < _pin.length;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isFilled ? MajuRideTheme.primaryGreen : Colors.transparent,
                    border: Border.all(
                      color: isFilled ? MajuRideTheme.primaryGreen : MajuRideTheme.textLight,
                      width: 2,
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tautan reset PIN telah dikirim ke nomor WhatsApp Anda'),
                    backgroundColor: MajuRideTheme.primaryGreen,
                  ),
                );
              },
              child: const Text(
                'Lupa PIN MajuPay?',
                style: TextStyle(color: MajuRideTheme.darkGreen, fontWeight: FontWeight.bold),
              ),
            ),

            const Spacer(),

            // Custom Secure Numeric Keypad
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildKeypadButton('1'),
                      _buildKeypadButton('2'),
                      _buildKeypadButton('3'),
                    ],
                  ),
                  Row(
                    children: [
                      _buildKeypadButton('4'),
                      _buildKeypadButton('5'),
                      _buildKeypadButton('6'),
                    ],
                  ),
                  Row(
                    children: [
                      _buildKeypadButton('7'),
                      _buildKeypadButton('8'),
                      _buildKeypadButton('9'),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      _buildKeypadButton('0'),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: _onDelete,
                            child: Container(
                              height: 54,
                              decoration: BoxDecoration(
                                color: MajuRideTheme.surfaceWhite,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: MajuRideTheme.cardBorder),
                              ),
                              child: const Center(
                                child: Icon(Icons.backspace_outlined, size: 22, color: MajuRideTheme.textDark),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
