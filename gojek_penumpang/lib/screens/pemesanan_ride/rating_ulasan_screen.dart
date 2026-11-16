import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import '../keuangan/pembayaran_selesai_screen.dart';

class RatingUlasanScreen extends StatefulWidget {
  final String driverName;
  final String destination;
  final String price;

  const RatingUlasanScreen({
    super.key,
    this.driverName = 'Budi Santoso',
    this.destination = 'Stasiun Gambir',
    this.price = 'Rp 14.000',
  });

  @override
  State<RatingUlasanScreen> createState() => _RatingUlasanScreenState();
}

class _RatingUlasanScreenState extends State<RatingUlasanScreen> {
  int _rating = 5;
  final List<String> _compliments = [
    'Driver Ramah',
    'Tepat Waktu',
    'Berkendara Aman',
    'Motor Bersih',
    'Rute Efisien',
  ];
  final Set<String> _selectedCompliments = {'Driver Ramah', 'Tepat Waktu'};
  final _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _submitReview() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PembayaranSelesaiScreen(
          merchantName: 'MajuRide - ${widget.driverName}',
          amount: widget.price,
          serviceType: 'Layanan Ojek MajuRide',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MajuRideTheme.surfaceWhite,
      appBar: AppBar(
        backgroundColor: MajuRideTheme.surfaceWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: MajuRideTheme.textDark),
          tooltip: 'Tutup / Lewati',
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/beranda');
            }
          },
        ),
        title: const Text(
          'Beri Ulasan Driver',
          style: TextStyle(
            color: MajuRideTheme.textDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: MajuRideTheme.cardBorder),
                ),
                child: Image.asset(
                  'assets/images/avatar_driver.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 50),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.driverName,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Bagaimana perjalanan Anda bersama mitra kami?',
                style: TextStyle(fontSize: 13, color: MajuRideTheme.textGrey),
              ),
              const SizedBox(height: 20),

              // Interactive 5 Star Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  final starNum = index + 1;
                  return IconButton(
                    iconSize: 38,
                    icon: Icon(
                      starNum <= _rating ? Icons.star_rounded : Icons.star_outline_rounded,
                      color: starNum <= _rating ? Colors.amber : MajuRideTheme.textLight,
                    ),
                    onPressed: () {
                      setState(() => _rating = starNum);
                    },
                  );
                }),
              ),
              const SizedBox(height: 6),
              Text(
                _rating == 5
                    ? 'Luar Biasa! ⭐⭐⭐⭐⭐'
                    : _rating >= 4
                        ? 'Sangat Baik! ⭐⭐⭐⭐'
                        : 'Cukup Baik',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: MajuRideTheme.darkGreen,
                ),
              ),
              const SizedBox(height: 24),

              // Compliment Chips
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Apa yang Anda sukai?',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _compliments.map((badge) {
                  final isSelected = _selectedCompliments.contains(badge);
                  return FilterChip(
                    label: Text(badge),
                    selected: isSelected,
                    selectedColor: MajuRideTheme.lightGreen,
                    checkmarkColor: MajuRideTheme.darkGreen,
                    backgroundColor: MajuRideTheme.bgGrey,
                    labelStyle: TextStyle(
                      color: isSelected ? MajuRideTheme.darkGreen : MajuRideTheme.textDark,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(
                        color: isSelected ? MajuRideTheme.primaryGreen : MajuRideTheme.cardBorder,
                      ),
                    ),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedCompliments.add(badge);
                        } else {
                          _selectedCompliments.remove(badge);
                        }
                      });
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              // Optional Comment Field
              TextField(
                controller: _commentController,
                maxLines: 3,
                style: const TextStyle(fontSize: 13.5),
                decoration: InputDecoration(
                  hintText: 'Tulis pesan apresiasi untuk driver (opsional)...',
                  hintStyle: const TextStyle(color: MajuRideTheme.textLight, fontSize: 13),
                  filled: true,
                  fillColor: MajuRideTheme.bgGrey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: MajuRideTheme.cardBorder),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MajuRideTheme.primaryGreen,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _submitReview,
                  child: const Text(
                    'Kirim Ulasan & Selesai',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
