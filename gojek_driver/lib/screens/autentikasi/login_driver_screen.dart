import 'package:flutter/material.dart';
import '../../constants/majuride_driver_theme.dart';
import 'verifikasi_otp_driver_screen.dart';
import 'registrasi_driver_screen.dart';

/// Screen: Login Nomor Telepon Driver (Node 9087:1913)
/// Layar autentikasi utama driver dengan validasi nomor HP terdaftar
class LoginDriverScreen extends StatefulWidget {
  const LoginDriverScreen({super.key});

  @override
  State<LoginDriverScreen> createState() => _LoginDriverScreenState();
}

class _LoginDriverScreenState extends State<LoginDriverScreen> {
  final TextEditingController _phoneController = TextEditingController(text: '812-3456-7890');
  bool _usePasswordMode = false;
  final TextEditingController _passController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _phoneController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void _onBack() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushReplacementNamed('/onboarding');
    }
  }

  void _onLanjutkan() {
    if (_phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Silakan masukkan nomor telepon Anda')),
      );
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => VerifikasiOtpDriverScreen(
          phoneNumber: '+62 ${_phoneController.text.trim()}',
        ),
      ),
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
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: MajuRideDriverTheme.mintBg,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Driver Mode',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: MajuRideDriverTheme.primaryGreen,
                  ),
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
                'Masuk sebagai Driver / Mitra Pengemudi',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: MajuRideDriverTheme.textBlack,
                  letterSpacing: -0.4,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Masukkan nomor telepon terdaftar kamu.',
                style: TextStyle(
                  fontSize: 14,
                  color: MajuRideDriverTheme.textGrey,
                ),
              ),
              const SizedBox(height: 28),

              // Form Label
              const Text(
                'Nomor Telepon',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: MajuRideDriverTheme.textBlack,
                ),
              ),
              const SizedBox(height: 8),

              // Phone Input Field
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: MajuRideDriverTheme.primaryGreen,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    const Text('🇮🇩', style: TextStyle(fontSize: 18)),
                    const SizedBox(width: 8),
                    const Text(
                      '+62',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: MajuRideDriverTheme.textBlack,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 1,
                      height: 24,
                      color: MajuRideDriverTheme.borderGrey,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: MajuRideDriverTheme.textBlack,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Masukkan nomor dahulu',
                          hintStyle: TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Switch Password Mode
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _usePasswordMode = !_usePasswordMode;
                    });
                  },
                  child: Text(
                    _usePasswordMode ? 'Masuk dengan Kode OTP?' : 'Masuk dengan Password?',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: MajuRideDriverTheme.primaryGreen,
                    ),
                  ),
                ),
              ),

              if (_usePasswordMode) ...[
                const SizedBox(height: 16),
                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: MajuRideDriverTheme.textBlack,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: MajuRideDriverTheme.borderGrey,
                      width: 1.2,
                    ),
                  ),
                  child: TextField(
                    controller: _passController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      hintText: 'Masukkan password Anda',
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          size: 20,
                          color: MajuRideDriverTheme.textGrey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],

              const Spacer(),

              // Button Lanjutkan
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _onLanjutkan,
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
                    'Lanjutkan',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Bottom Register Link
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Belum punya akun? ',
                      style: TextStyle(
                        fontSize: 13,
                        color: MajuRideDriverTheme.textGrey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const RegistrasiDriverScreen()),
                        );
                      },
                      child: const Text(
                        'Daftar',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: MajuRideDriverTheme.primaryGreen,
                        ),
                      ),
                    ),
                  ],
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
