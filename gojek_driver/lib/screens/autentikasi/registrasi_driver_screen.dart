import 'package:flutter/material.dart';
import '../../constants/majuride_driver_theme.dart';
import 'login_berhasil_screen.dart';

/// Screen: Pendaftaran Mitra Driver Baru (Node 7:290)
/// Form pendaftaran data driver, nomor telepon, dan tipe armada kendaraan
class RegistrasiDriverScreen extends StatefulWidget {
  const RegistrasiDriverScreen({super.key});

  @override
  State<RegistrasiDriverScreen> createState() => _RegistrasiDriverScreenState();
}

class _RegistrasiDriverScreenState extends State<RegistrasiDriverScreen> {
  final TextEditingController _nameController = TextEditingController(text: 'Budi Santoso');
  final TextEditingController _phoneController = TextEditingController(text: '081234567890');
  String _selectedVehicle = 'Motor (MajuRide )';

  final List<String> _vehicleTypes = [
    'Motor (MajuRide )',
    'Mobil (MajuCar)',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onBack() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushReplacementNamed('/onboarding');
    }
  }

  void _onSubmit() {
    if (_nameController.text.trim().isEmpty || _phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap lengkapi semua data pendaftaran')),
      );
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => LoginBerhasilScreen(
          driverName: _nameController.text.trim(),
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                'Daftar Driver MajuRide',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: MajuRideDriverTheme.textBlack,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Lengkapi data kendaraan & dokumen.',
                style: TextStyle(
                  fontSize: 14,
                  color: MajuRideDriverTheme.textGrey,
                ),
              ),
              const SizedBox(height: 28),

              // Field 1: Nama Lengkap
              const Text(
                'Nama Lengkap',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: MajuRideDriverTheme.textBlack,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: MajuRideDriverTheme.borderGrey,
                    width: 1.2,
                  ),
                ),
                child: TextField(
                  controller: _nameController,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: MajuRideDriverTheme.textBlack,
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Field 2: Nomor Telepon
              const Text(
                'Nomor Telepon',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: MajuRideDriverTheme.textBlack,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: MajuRideDriverTheme.borderGrey,
                    width: 1.2,
                  ),
                ),
                child: TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: MajuRideDriverTheme.textBlack,
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Field 3: Jenis Kendaraan
              const Text(
                'Jenis Kendaraan',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: MajuRideDriverTheme.textBlack,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: MajuRideDriverTheme.borderGrey,
                    width: 1.2,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedVehicle,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down, color: MajuRideDriverTheme.textGrey),
                    items: _vehicleTypes.map((type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(
                          type,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: MajuRideDriverTheme.textBlack,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          _selectedVehicle = val;
                        });
                      }
                    },
                  ),
                ),
              ),

              const Spacer(),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _onSubmit,
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
                    'Kirim Pendaftaran Driver',
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
