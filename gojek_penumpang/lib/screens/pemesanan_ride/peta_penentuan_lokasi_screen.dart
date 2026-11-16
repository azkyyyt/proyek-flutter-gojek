import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import 'pilihan_layanan_tarif_screen.dart';

class PetaPenentuanLokasiScreen extends StatelessWidget {
  const PetaPenentuanLokasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Authentic Figma Map Image (Node 8706:1176)
          Positioned.fill(
            child: Image.asset(
              'C:/Users/Azkia Akbar Pratama/.gemini/antigravity/brain/383dce38-76c3-43ff-aaad-822a5377ac4c/figma_renders/8706_1176.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: const Color(0xFFE2F1E8),
                child: const Center(
                  child: Icon(Icons.map, size: 80, color: MajuRideTheme.primaryGreen),
                ),
              ),
            ),
          ),

          // Top Location Bar (Figma Node 8706:1176)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back,
                          color: MajuRideTheme.textDark, size: 20),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.location_on,
                        color: Color(0xFFEF4444), size: 20),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'Komplek TNI-AD RUDAL 001',
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold,
                          color: MajuRideTheme.textDark,
                        ),
                      ),
                    ),
                    const Icon(Icons.camera_alt_outlined,
                        size: 18, color: MajuRideTheme.textGrey),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Sheet: "Pilih Tujuan Ini"
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle
                  Container(
                    width: 44,
                    height: 4,
                    decoration: BoxDecoration(
                      color: MajuRideTheme.cardBorder,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Location Info Row
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0xFFD1FAE5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.location_on,
                            size: 22, color: MajuRideTheme.primaryGreen),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Komplek TNI-AD RUDAL 001',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: MajuRideTheme.textDark,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '3 km • Komplek TNI-AD RUDAL 001.',
                              style: TextStyle(
                                fontSize: 12,
                                color: MajuRideTheme.textGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  // Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MajuRideTheme.primaryGreen,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PilihanLayananTarifScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Pilih Tujuan Ini',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
