import 'package:flutter/material.dart';

class MajuRideTheme {
  // Brand Colors (MajuRide Authentic Figma Palette)
  static const Color primaryGreen = Color(0xFF009B60);
  static const Color darkGreen = Color(0xFF007A4B);
  static const Color lightGreen = Color(0xFFE8F8F2);
  static const Color accentGreen = Color(0xFF10B981);
  static const Color redDanger = Color(0xFFEF4444);
  static const Color amberWarning = Color(0xFFF59E0B);

  // Neutral Tones
  static const Color textDark = Color(0xFF0F172A);
  static const Color textBody = Color(0xFF334155);
  static const Color textGrey = Color(0xFF64748B);
  static const Color textLight = Color(0xFF94A3B8);
  static const Color bgLight = Color(0xFFF8FAFC);
  static const Color bgGrey = Color(0xFFF8FAFC);
  static const Color cardBorder = Color(0xFFE2E8F0);
  static const Color buttonGrey = Color(0xFFF1F5F9);
  static const Color surfaceWhite = Colors.white;

  // Box Shadows
  static List<BoxShadow> get softShadow => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get cardShadow => softShadow;
}
