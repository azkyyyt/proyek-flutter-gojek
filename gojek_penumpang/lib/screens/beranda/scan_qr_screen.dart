import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import '../keuangan/pembayaran_selesai_screen.dart';

class ScanQrScreen extends StatelessWidget {
  const ScanQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              // Back Button
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushReplacementNamed(context, '/beranda');
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
              ),

              const Spacer(flex: 2),

              // "QRIS SUPPORTED"
              const Text(
                'QRIS\nSUPPORTED',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                  color: MajuRideTheme.textDark,
                ),
              ),
              const SizedBox(height: 36),

              // Viewfinder brackets
              CustomPaint(
                size: const Size(180, 180),
                painter: _ViewfinderPainter(),
              ),

              const Spacer(flex: 3),

              // "Scan" Button
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PembayaranSelesaiScreen(
                          merchantName: 'Rayyan putri',
                          amount: 'Rp 10.000',
                          serviceType: 'QRIS',
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Scan',
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

class _ViewfinderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final w = size.width;
    final h = size.height;
    const corner = 36.0;

    // Top-Left
    final pathTL = Path()
      ..moveTo(0, corner)
      ..lineTo(0, 16)
      ..quadraticBezierTo(0, 0, 16, 0)
      ..lineTo(corner, 0);
    canvas.drawPath(pathTL, paint);

    // Top-Right
    final pathTR = Path()
      ..moveTo(w - corner, 0)
      ..lineTo(w - 16, 0)
      ..quadraticBezierTo(w, 0, w, 16)
      ..lineTo(w, corner);
    canvas.drawPath(pathTR, paint);

    // Center Horizontal Line
    canvas.drawLine(
      Offset(0, h / 2),
      Offset(w, h / 2),
      paint..strokeWidth = 10,
    );

    // Bottom-Left
    final pathBL = Path()
      ..moveTo(0, h - corner)
      ..lineTo(0, h - 16)
      ..quadraticBezierTo(0, h, 16, h)
      ..lineTo(corner, h);
    canvas.drawPath(pathBL, paint);

    // Bottom-Right
    final pathBR = Path()
      ..moveTo(w - corner, h)
      ..lineTo(w - 16, h)
      ..quadraticBezierTo(w, h, w, h - 16)
      ..lineTo(w, h - corner);
    canvas.drawPath(pathBR, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
