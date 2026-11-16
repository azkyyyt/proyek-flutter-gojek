import 'package:flutter/material.dart';
import 'constants/majuride_driver_theme.dart';
import 'screens/autentikasi/splash_screen.dart';
import 'screens/autentikasi/welcome_onboarding_screen.dart';
import 'screens/autentikasi/login_driver_screen.dart';
import 'screens/autentikasi/verifikasi_otp_driver_screen.dart';
import 'screens/autentikasi/registrasi_driver_screen.dart';
import 'screens/autentikasi/login_berhasil_screen.dart';
import 'screens/driver_main_navigation.dart';
import 'screens/beranda/beranda_driver_screen.dart';
import 'screens/pesanan/peta_jemput_penumpang_screen.dart';
import 'screens/pesanan/peta_menuju_tujuan_screen.dart';
import 'screens/pesanan/perjalanan_selesai_screen.dart';
import 'screens/pesanan/rating_penumpang_screen.dart';
import 'screens/pesanan/riwayat_perjalanan_screen.dart';
import 'screens/dompet/dompet_driver_screen.dart';
import 'screens/dompet/cairkan_saldo_screen.dart';
import 'screens/dompet/pencairan_berhasil_screen.dart';
import 'screens/profil/profil_driver_screen.dart';
import 'screens/profil/pengajuan_edit_data_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MajuRideDriverApp());
}

/// Root Application MajuRide Driver
/// Terstruktur 1:1 sesuai desain Figma Page driver MajuRide (8587:457)
class MajuRideDriverApp extends StatelessWidget {
  const MajuRideDriverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MajuRide Driver',
      debugShowCheckedModeBanner: false,
      theme: MajuRideDriverTheme.theme,
      // Layar awal langsung terbuka ke Splash Screen awal sesuai permintaan wajib user
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/splash': (context) => const SplashScreen(),
        '/onboarding': (context) => const WelcomeOnboardingScreen(),
        '/login': (context) => const LoginDriverScreen(),
        '/otp': (context) => const VerifikasiOtpDriverScreen(),
        '/registrasi': (context) => const RegistrasiDriverScreen(),
        '/login_berhasil': (context) => const LoginBerhasilScreen(),
        '/main_nav': (context) => const DriverMainNavigation(),
        '/beranda': (context) => const BerandaDriverScreen(),
        '/peta_jemput': (context) => const PetaJemputPenumpangScreen(),
        '/peta_tujuan': (context) => const PetaMenujuTujuanScreen(),
        '/perjalanan_selesai': (context) => const PerjalananSelesaiScreen(),
        '/rating': (context) => const RatingPenumpangScreen(),
        '/riwayat': (context) => const RiwayatPerjalananScreen(),
        '/dompet': (context) => const DompetDriverScreen(),
        '/cairkan_saldo': (context) => const CairkanSaldoScreen(),
        '/pencairan_berhasil': (context) => const PencairanBerhasilScreen(),
        '/profil': (context) => const ProfilDriverScreen(),
        '/pengajuan_edit': (context) => const PengajuanEditDataScreen(),
      },
    );
  }
}
