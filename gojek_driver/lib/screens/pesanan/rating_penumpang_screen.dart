import 'package:flutter/material.dart';
import '../../constants/majuride_driver_theme.dart';
import '../driver_main_navigation.dart';

/// Screen: Rating Penumpang (Node 8864:3056)
/// Umpan balik bintang dan apresiasi driver untuk penumpang setelah trip selesai
class RatingPenumpangScreen extends StatefulWidget {
  const RatingPenumpangScreen({super.key});

  @override
  State<RatingPenumpangScreen> createState() => _RatingPenumpangScreenState();
}

class _RatingPenumpangScreenState extends State<RatingPenumpangScreen> {
  int _selectedStars = 5;
  final Set<String> _selectedTags = {'Sesuai Titik Jemput', 'Sopan & Ramah'};

  final List<String> _tags = [
    'Sesuai Titik Jemput',
    'Sopan & Ramah',
    'Tepat Waktu',
  ];

  void _onComplete() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => const DriverMainNavigation(initialIndex: 0),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 50),

              // Passenger Avatar "A"
              Container(
                width: 72,
                height: 72,
                decoration: const BoxDecoration(
                  color: MajuRideDriverTheme.mintLight,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'A',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: MajuRideDriverTheme.primaryGreen,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Bagaimana Penumpang Azkia?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: MajuRideDriverTheme.textBlack,
                  letterSpacing: -0.3,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Beri penilaian pengalaman Anda melayani penumpang ini.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: MajuRideDriverTheme.textGrey,
                ),
              ),

              const SizedBox(height: 28),

              // 5 Stars
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  final starNum = index + 1;
                  final isFilled = starNum <= _selectedStars;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedStars = starNum;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Icon(
                        isFilled ? Icons.star_rounded : Icons.star_outline_rounded,
                        size: 38,
                        color: const Color(0xFFF59E0B),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 28),

              // Feedback Chips
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 10,
                children: _tags.map((tag) {
                  final isSelected = _selectedTags.contains(tag);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedTags.remove(tag);
                        } else {
                          _selectedTags.add(tag);
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? MajuRideDriverTheme.mintBg : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? MajuRideDriverTheme.primaryGreen
                              : MajuRideDriverTheme.borderGrey,
                          width: 1.2,
                        ),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? MajuRideDriverTheme.primaryGreen
                              : MajuRideDriverTheme.textGrey,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const Spacer(),

              // Button: Ayo gas narik lagi!
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _onComplete,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF008A59),
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Ayo gas narik lagi!',
                    style: TextStyle(
                      fontSize: 14,
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
