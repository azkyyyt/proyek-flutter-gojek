import 'dart:async';
import 'package:flutter/material.dart';
import '../../constants/majuride_merchant_theme.dart';

/// Screen: Verifikasi OTP 6-Digit Merchant MajuRide
/// Node Figma: 8614:3378 & 8614:3835
class MerchantOtpScreen extends StatefulWidget {
  final String? phoneNumber;
  const MerchantOtpScreen({super.key, this.phoneNumber});

  @override
  State<MerchantOtpScreen> createState() => _MerchantOtpScreenState();
}

class _MerchantOtpScreenState extends State<MerchantOtpScreen> {
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  int _counter = 15;
  Timer? _timer;
  bool _hasError = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _counter = 15;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  void _onBack() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  String get _currentOtp => _controllers.map((c) => c.text.trim()).join();

  void _verify() {
    if (_currentOtp.isEmpty) {
      setState(() {
        _hasError = true;
        _errorMessage = 'Kode OTP belum diisi. Silakan masukkan 6 digit kode.';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kode OTP belum diisi. Silakan masukkan 6 digit kode verifikasi.'),
          backgroundColor: MajuRideMerchantTheme.errorRed,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (_currentOtp.length < 6) {
      setState(() {
        _hasError = true;
        _errorMessage = 'Kode OTP tidak lengkap (${_currentOtp.length}/6 digit). Harap isi semua kolom.';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Kode OTP tidak lengkap (${_currentOtp.length}/6 digit). Harap isi semua kolom.'),
          backgroundColor: MajuRideMerchantTheme.errorRed,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (_currentOtp == '999999') {
      setState(() {
        _hasError = true;
        _errorMessage = 'Kode OTP salah. Silakan coba lagi.';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kode OTP salah. Silakan coba lagi.'),
          backgroundColor: MajuRideMerchantTheme.errorRed,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() {
      _hasError = false;
      _errorMessage = null;
    });
    Navigator.pushReplacementNamed(context, '/login_success');
  }

  @override
  Widget build(BuildContext context) {
    final phone = widget.phoneNumber ?? '+62 812-3456-7890';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Bar: Back button & Ubah Nomor
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Icons.arrow_back,
                        color: Color(0xFF0F172A),
                        size: 20,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _onBack,
                    behavior: HitTestBehavior.opaque,
                    child: const Row(
                      children: [
                        Icon(Icons.edit_outlined, size: 14, color: MajuRideMerchantTheme.primaryGreen),
                        SizedBox(width: 4),
                        Text(
                          'Ubah Nomor',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: MajuRideMerchantTheme.primaryGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Title & Subtitle sesuai Figma
              const Text(
                'Verifikasi nomor telepon',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Kode OTP dikirim ke $phone',
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 14,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 36),

              // 6 Boxes Sesuai Figma (Rounded rectangle dengan border hijau)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 0 : 3.5,
                        right: index == 5 ? 0 : 3.5,
                      ),
                      height: 52,
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: _hasError
                            ? MajuRideMerchantTheme.errorRed
                            : MajuRideMerchantTheme.primaryGreen,
                        width: 1.5,
                      ),
                    ),
                    child: Center(
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _hasError ? MajuRideMerchantTheme.errorRed : const Color(0xFF0F172A),
                        ),
                        decoration: const InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        onChanged: (val) {
                          if (_hasError) {
                            setState(() {
                              _hasError = false;
                              _errorMessage = null;
                            });
                          }
                          if (val.isNotEmpty && index < 5) {
                            _focusNodes[index + 1].requestFocus();
                          } else if (val.isEmpty && index > 0) {
                            _focusNodes[index - 1].requestFocus();
                          }
                          if (index == 5 && val.isNotEmpty) {
                            if (_currentOtp.length == 6) {
                              _verify();
                            }
                          }
                        },
                      ),
                    ),
                  ),
                );
              }),
              ),
              const SizedBox(height: 20),

              // Kirim Ulang Countdown (Bisa diklik jika counter 0 atau untuk resend)
              Center(
                child: GestureDetector(
                  onTap: _counter == 0
                      ? () {
                          _startTimer();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Kode OTP baru telah dikirimkan!')),
                          );
                        }
                      : null,
                  child: RichText(
                    text: TextSpan(
                      text: _counter == 0 ? 'Kirim ulang sekarang' : 'Kirim ulang kode dalam ',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 13,
                        color: _counter == 0 ? MajuRideMerchantTheme.primaryGreen : const Color(0xFF64748B),
                        fontWeight: _counter == 0 ? FontWeight.bold : FontWeight.normal,
                      ),
                      children: [
                        if (_counter > 0)
                          TextSpan(
                            text: '00:${_counter.toString().padLeft(2, '0')}',
                            style: const TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.bold,
                              color: MajuRideMerchantTheme.primaryGreen,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // Tombol OTP Salah (State Sesuai Figma Node 8614:3835)
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _hasError = !_hasError;
                      _errorMessage = _hasError ? 'Kode OTP salah. Silakan coba lagi.' : null;
                    });
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: _hasError ? MajuRideMerchantTheme.errorRed : MajuRideMerchantTheme.primaryGreen,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      _hasError ? 'Kode Verifikasi Salah!' : 'OTP Salah',
                      style: const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              if (_errorMessage != null) ...[
                const SizedBox(height: 16),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEE2E2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFFCA5A5)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 16,
                          color: MajuRideMerchantTheme.errorRed,
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            _errorMessage!,
                            style: const TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontSize: 12,
                              color: MajuRideMerchantTheme.errorRed,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],

              const Spacer(),

              // Button: Verifikasi
              ElevatedButton(
                onPressed: _verify,
                style: ElevatedButton.styleFrom(
                  backgroundColor: MajuRideMerchantTheme.primaryGreen,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  'Verifikasi',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
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
}
