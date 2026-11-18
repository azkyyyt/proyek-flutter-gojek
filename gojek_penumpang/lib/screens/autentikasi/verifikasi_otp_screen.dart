import 'dart:async';
import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import 'lengkapi_profil_screen.dart';

class VerifikasiOTPScreen extends StatefulWidget {
  final String phoneNumber;

  const VerifikasiOTPScreen({
    super.key,
    this.phoneNumber = '+62 812-3456-7890',
  });

  @override
  State<VerifikasiOTPScreen> createState() => _VerifikasiOTPScreenState();
}

class _VerifikasiOTPScreenState extends State<VerifikasiOTPScreen> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  int _countdown = 15;
  Timer? _timer;
  bool _hasError = false;
  String? _errorMessage;

  String get _currentOtp => _controllers.map((c) => c.text.trim()).join();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _countdown = 15;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
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

  void _onDigitChanged(int index, String value) {
    if (_hasError) {
      setState(() {
        _hasError = false;
        _errorMessage = null;
      });
    }
    if (value.isNotEmpty) {
      if (index < 5) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
        if (_currentOtp.length == 6) {
          _verifyOtp();
        }
      }
    } else {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }
    setState(() {});
  }

  void _verifyOtp() {
    if (_currentOtp.isEmpty) {
      setState(() {
        _hasError = true;
        _errorMessage = 'Kode OTP belum diisi. Silakan masukkan 6 digit kode.';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kode OTP belum diisi. Silakan masukkan 6 digit kode verifikasi.'),
          backgroundColor: Color(0xFFEF4444),
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
          backgroundColor: const Color(0xFFEF4444),
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
          backgroundColor: Color(0xFFEF4444),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() {
      _hasError = false;
      _errorMessage = null;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LengkapiProfilScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pushReplacementNamed(context, '/login');
                      }
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: MajuRideTheme.buttonGrey,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: MajuRideTheme.textDark,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pushReplacementNamed(context, '/login');
                      }
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.edit_outlined,
                          size: 16,
                          color: MajuRideTheme.primaryGreen,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Ubah Nomor',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: MajuRideTheme.primaryGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Title and Subtitle
              const Text(
                'Verifikasi nomor telepon',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: MajuRideTheme.textDark,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  text: 'Kode OTP dikirim ke ',
                  style: const TextStyle(
                    fontSize: 14,
                    color: MajuRideTheme.textGrey,
                  ),
                  children: [
                    TextSpan(
                      text: widget.phoneNumber,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MajuRideTheme.textDark,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // 6 OTP Digit Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  final isFilled = _controllers[index].text.isNotEmpty;
                  final isFocused = _focusNodes[index].hasFocus;
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 0 : 3.5,
                        right: index == 5 ? 0 : 3.5,
                      ),
                      height: 52,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: _hasError
                            ? const Color(0xFFEF4444)
                            : ((isFilled || isFocused)
                                ? MajuRideTheme.primaryGreen
                                : MajuRideTheme.cardBorder),
                        width: (isFilled || isFocused || _hasError) ? 1.8 : 1.5,
                      ),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: MajuRideTheme.textDark,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: '',
                        contentPadding: EdgeInsets.zero,
                      ),
                      onChanged: (val) => _onDigitChanged(index, val),
                    ),
                  ),
                );
              }),
              ),
              const SizedBox(height: 24),

              // Countdown / Resend
              Center(
                child: _countdown > 0
                    ? RichText(
                        text: TextSpan(
                          text: 'Kirim ulang kode dalam ',
                          style: const TextStyle(
                            fontSize: 13,
                            color: MajuRideTheme.textGrey,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  '00:${_countdown.toString().padLeft(2, '0')}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MajuRideTheme.primaryGreen,
                              ),
                            ),
                          ],
                        ),
                      )
                    : GestureDetector(
                        onTap: _startTimer,
                        child: const Text(
                          'Kirim Ulang Kode OTP',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: MajuRideTheme.primaryGreen,
                          ),
                        ),
                      ),
              ),

              if (_errorMessage != null) ...[
                const SizedBox(height: 14),
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
                          color: Color(0xFFEF4444),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            _errorMessage!,
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFFEF4444),
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

              // Verifikasi Button
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
                  onPressed: _verifyOtp,
                  child: const Text(
                    'Verifikasi',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
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
}
