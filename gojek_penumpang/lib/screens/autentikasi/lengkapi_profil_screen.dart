import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import '../beranda/beranda_penumpang_screen.dart';

class LengkapiProfilScreen extends StatefulWidget {
  const LengkapiProfilScreen({super.key});

  @override
  State<LengkapiProfilScreen> createState() => _LengkapiProfilScreenState();
}

class _LengkapiProfilScreenState extends State<LengkapiProfilScreen> {
  final TextEditingController _namaController =
      TextEditingController(text: 'Azkia Akbar Pratama');
  final TextEditingController _phoneController =
      TextEditingController(text: '+62 812-3456-7890');

  @override
  void dispose() {
    _namaController.dispose();
    _phoneController.dispose();
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
                'Lengkapi Profilmu',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: MajuRideTheme.textDark,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Lengkapi data diri untuk akun MajuRide.',
                style: TextStyle(
                  fontSize: 14,
                  color: MajuRideTheme.textGrey,
                ),
              ),
              const SizedBox(height: 28),

              // Profile Avatar
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD1FAE5),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: MajuRideTheme.primaryGreen,
                          width: 2,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'AP',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: MajuRideTheme.primaryGreen,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Foto Profil',
                      style: TextStyle(
                        fontSize: 12,
                        color: MajuRideTheme.textLight,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Nama Lengkap *
              const Text(
                'Nama Lengkap *',
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
                  controller: _namaController,
                  style: const TextStyle(
                    fontSize: 14,
                    color: MajuRideTheme.textDark,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Email (Google)
              const Text(
                'Email (Google)',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: MajuRideTheme.textBody,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: MajuRideTheme.bgLight,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: MajuRideTheme.cardBorder),
                ),
                child: const Text(
                  'azkia@example.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: MajuRideTheme.textGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Nomor Telepon *
              const Text(
                'Nomor Telepon *',
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
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                    fontSize: 14,
                    color: MajuRideTheme.textDark,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),

              const Spacer(),

              // Simpan dan Lanjutkan Button
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
                    final nama = _namaController.text.trim();
                    final phone = _phoneController.text.trim();

                    if (nama.isEmpty || phone.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Harap lengkapi nama dan nomor telepon Anda.'),
                          backgroundColor: Color(0xFFEF4444),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      return;
                    }

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BerandaPenumpangScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'Simpan dan Lanjutkan',
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
