import 'package:flutter/material.dart';
import 'screens/autentikasi/splash_screen.dart';
import 'screens/autentikasi/halaman_dashboard_screen.dart';
import 'screens/autentikasi/login_screen.dart';
import 'screens/autentikasi/registrasi_screen.dart';
import 'screens/beranda/beranda_penumpang_screen.dart';
import 'screens/keuangan/dompet_majupay_screen.dart';
import 'screens/aktivitas/riwayat_aktivitas_screen.dart';
import 'screens/pesan/kotak_masuk_screen.dart';
import 'screens/profil/profil_penumpang_screen.dart';
import 'theme/majuride_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MajuRidePenumpangApp());
}

class MajuRidePenumpangApp extends StatelessWidget {
  const MajuRidePenumpangApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MajuRide Penumpang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: MajuRideTheme.primaryGreen,
          primary: MajuRideTheme.primaryGreen,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: MajuRideTheme.textDark),
          titleTextStyle: TextStyle(
            color: MajuRideTheme.textDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // Langsung terbuka tampilan Splash Screen awal sesuai permintaan wajib user
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/splash': (context) => const SplashScreen(),
        '/welcome': (context) => const HalamanDashboardScreen(),
        '/dashboard': (context) => const HalamanDashboardScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegistrasiScreen(),
        '/beranda': (context) => const BerandaPenumpangScreen(),
        '/keuangan': (context) => const DompetMajupayScreen(),
        '/aktivitas': (context) => const RiwayatAktivitasScreen(),
        '/kotak_masuk': (context) => const KotakMasukScreen(),
        '/profil': (context) => const ProfilPenumpangScreen(),
      },
    );
  }
}
