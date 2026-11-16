/import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import 'masuk_password_screen.dart';

class AturUlangPasswordScreen extends StatefulWidget {
  const AturUlangPasswordScreen({super.key});

  @override
  State<AturUlangPasswordScreen> createState() =>
      _AturUlangPasswordScreenState();
}

class _AturUlangPasswordScreenState extends State<AturUlangPasswordScreen> {
  final TextEditingController _newPassController =
      TextEditingController(text: 'passwordbaru123');
  final TextEditingController _confirmPassController =
      TextEditingController(text: 'passwordbaru123');

  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _newPassController.dispose();
    _confirmPassController.dispose();
    super.dispose();
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
              // Back Button
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
              const SizedBox(height: 24),

              // Title and Subtitle
              const Text(
                'Atur ulang password',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: MajuRideTheme.textDark,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Buat password baru yang aman.',
                style: TextStyle(
                  fontSize: 14,
                  color: MajuRideTheme.textGrey,
                ),
              ),
              const SizedBox(height: 28),

              // Password Baru
              const Text(
                'Password Baru',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: MajuRideTheme.textBody,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: MajuRideTheme.cardBorder),
                ),
                child: TextField(
                  controller: _newPassController,
                  obscureText: _obscureNew,
                  style: const TextStyle(
                    fontSize: 14,
                    color: MajuRideTheme.textDark,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureNew
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 20,
                        color: MajuRideTheme.textLight,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureNew = !_obscureNew;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Konfirmasi Password Baru
              const Text(
                'Konfirmasi Password Baru',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: MajuRideTheme.textBody,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: MajuRideTheme.cardBorder),
                ),
                child: TextField(
                  controller: _confirmPassController,
                  obscureText: _obscureConfirm,
                  style: const TextStyle(
                    fontSize: 14,
                    color: MajuRideTheme.textDark,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirm
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 20,
                        color: MajuRideTheme.textLight,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirm = !_obscureConfirm;
                        });
                      },
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // Simpan Password Baru Button
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
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password berhasil diatur ulang!'),
                        backgroundColor: MajuRideTheme.primaryGreen,
                      ),
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MasukPasswordScreen(),
                      ),
                      (route) => route.isFirst,
                    );
                  },
                  child: const Text(
                    'Simpan Password Baru',
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
