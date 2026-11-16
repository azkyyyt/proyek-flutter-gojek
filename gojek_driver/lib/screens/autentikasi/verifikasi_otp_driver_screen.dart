import 'dart:async';
import 'package:flutter/material.dart';
import '../../constants/majuride_driver_theme.dart';
import 'login_berhasil_screen.dart';

/// Screen: Verifikasi OTP Driver (Node 16:497 & 8614:3993)
/// Input 6 digit OTP interaktif dengan timer countdown dan validasi status
class VerifikasiOtpDriverScreen extends StatefulWidget {
  final String phoneNumber;

  const VerifikasiOtpDriverScreen({
    super.key,
    this.phoneNumber = '+62 812-3456-7890',
  });

  @override
  State<VerifikasiOtpDriverScreen> createState() => _VerifikasiOtpDriverScreenState();
}

class _VerifikasiOtpDriverScreenState extends State<VerifikasiOtpDriverScreen> {
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  int _secondsRemaining = 15;
  Timer? _timer;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _startTimer();
    // Default pre-fill dummy OTP or allow typing
    for (int i = 0; i < 6; i++) {
      _controllers[i].text = '';
    }
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _secondsRemaining = 15;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
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

  String get _currentOtp => _controllers.map((c) => c.text).join();

  void _onBack() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  void _onVerify() {
    if (_currentOtp.isEmpty) {
      setState(() {
        _errorMessage = 'Kode OTP belum diisi. Silakan masukkan 6 digit kode.';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kode OTP belum diisi. Silakan masukkan 6 digit kode verifikasi.'),
          backgroundColor: MajuRideDriverTheme.errorRed,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (_currentOtp.length < 6) {
      setState(() {
        _errorMessage = 'Kode OTP tidak lengkap (${_currentOtp.length}/6 digit). Harap isi semua kolom.';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Kode OTP tidak lengkap (${_currentOtp.length}/6 digit). Harap isi semua kolom.'),
          backgroundColor: MajuRideDriverTheme.errorRed,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // If entered OTP is "999999", show error matching Figma frame 8614:3993
    if (_currentOtp == '999999') {
      setState(() {
        _errorMessage = 'Kode OTP salah. Silakan coba lagi.';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kode OTP salah. Silakan coba lagi.'),
          backgroundColor: MajuRideDriverTheme.errorRed,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() {
      _errorMessage = null;
    });

    // Otherwise success and proceed to Login Berhasil screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginBerhasilScreen()),
    );
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Center(
              child: GestureDetector(
                onTap: _onBack,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.edit_outlined,
                      size: 14,
                      color: MajuRideDriverTheme.primaryGreen,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Ubah Nomor',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: MajuRideDriverTheme.primaryGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Verifikasi nomor telepon',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: MajuRideDriverTheme.textBlack,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 14,
                    color: MajuRideDriverTheme.textGrey,
                  ),
                  children: [
                    const TextSpan(text: 'Kode OTP dikirim ke '),
                    TextSpan(
                      text: widget.phoneNumber,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MajuRideDriverTheme.textBlack,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // 6 OTP Digit Input Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  final isFilled = _controllers[index].text.isNotEmpty;
                  final hasError = _errorMessage != null;

                  return Container(
                    width: 46,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: hasError
                            ? MajuRideDriverTheme.errorRed
                            : (isFilled
                                ? MajuRideDriverTheme.primaryGreen
                                : MajuRideDriverTheme.borderGrey),
                        width: isFilled || hasError ? 1.8 : 1.2,
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
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: hasError
                              ? MajuRideDriverTheme.errorRed
                              : MajuRideDriverTheme.textBlack,
                        ),
                        decoration: const InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          isDense: true,
                        ),
                        onChanged: (val) {
                          if (val.isNotEmpty && index < 5) {
                            _focusNodes[index + 1].requestFocus();
                          } else if (val.isEmpty && index > 0) {
                            _focusNodes[index - 1].requestFocus();
                          }
                          setState(() {
                            _errorMessage = null;
                          });
                          if (index == 5 && val.isNotEmpty) {
                            if (_currentOtp.length == 6) {
                              _onVerify();
                            }
                          }
                        },
                      ),
                    ),
                  );
                }),
              ),

              if (_errorMessage != null) ...[
                const SizedBox(height: 12),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 16,
                        color: MajuRideDriverTheme.errorRed,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _errorMessage!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: MajuRideDriverTheme.errorRed,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              const SizedBox(height: 24),

              // Timer / Resend Code
              Center(
                child: _secondsRemaining > 0
                    ? Text(
                        'Kirim ulang kode dalam 00:${_secondsRemaining.toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: MajuRideDriverTheme.textGrey,
                        ),
                      )
                    : GestureDetector(
                        onTap: _startTimer,
                        child: const Text(
                          'Kirim ulang Kode OTP',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: MajuRideDriverTheme.primaryGreen,
                          ),
                        ),
                      ),
              ),

              const Spacer(),

              // Verifikasi Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _onVerify,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MajuRideDriverTheme.primaryGreen,
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shadowColor: MajuRideDriverTheme.primaryGreen.withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Verifikasi',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
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
