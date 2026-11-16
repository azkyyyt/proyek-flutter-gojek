import 'package:flutter/material.dart';

/// Tema Resmi MajuRide Merchant
/// Disesuaikan 1:1 dengan Page Figma: merchant MajuRide (Node 8644:1346)
class MajuRideMerchantTheme {
  // Brand Colors
  static const Color primaryGreen = Color(0xFF008A59);
  static const Color accentGreen = Color(0xFF00A86B);
  static const Color mintBg = Color(0xFFE8F5E9);
  static const Color mintLight = Color(0xFFD1FAE5);
  static const Color darkNavy = Color(0xFF0F172A);
  static const Color cardNavy = Color(0xFF1E293B);
  static const Color bgGrey = Color(0xFFF8FAFC);
  static const Color textBlack = Color(0xFF0F172A);
  static const Color textGrey = Color(0xFF64748B);
  static const Color borderGrey = Color(0xFFE2E8F0);
  static const Color alertYellow = Color(0xFFFEF3C7);
  static const Color alertBorder = Color(0xFFFDE68A);
  static const Color alertText = Color(0xFFB45309);
  static const Color errorRed = Color(0xFFEF4444);
  static const Color chipGrey = Color(0xFFF1F5F9);
  static const Color starOrange = Color(0xFFF59E0B);

  // Box Shadows
  static List<BoxShadow> get cardShadow => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get buttonShadow => [
        BoxShadow(
          color: primaryGreen.withValues(alpha: 0.3),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ];

  // ThemeData
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: bgGrey,
        fontFamily: 'Plus Jakarta Sans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryGreen,
          primary: primaryGreen,
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          iconTheme: IconThemeData(color: textBlack),
          titleTextStyle: TextStyle(
            color: textBlack,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
