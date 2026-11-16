import 'package:flutter/material.dart';
import 'constants/majuride_merchant_theme.dart';
import 'screens/autentikasi/merchant_splash_screen.dart';
import 'screens/autentikasi/merchant_welcome_screen.dart';
import 'screens/autentikasi/merchant_login_screen.dart';
import 'screens/autentikasi/merchant_otp_screen.dart';
import 'screens/autentikasi/merchant_register_screen.dart';
import 'screens/autentikasi/merchant_login_success_screen.dart';
import 'screens/merchant_main_navigation.dart';
import 'screens/dashboard/merchant_dashboard_screen.dart';
import 'screens/dashboard/merchant_status_operasional_screen.dart';
import 'screens/pesanan/merchant_penyiapan_pesanan_screen.dart';
import 'screens/pesanan/merchant_pengantaran_pesanan_screen.dart';
import 'screens/kelola_menu/merchant_kelola_menu_screen.dart';
import 'screens/kelola_menu/merchant_tambah_menu_screen.dart';
import 'screens/keuangan/merchant_dompet_screen.dart';
import 'screens/keuangan/merchant_performa_toko_screen.dart';
import 'screens/keuangan/merchant_cairkan_saldo_screen.dart';
import 'screens/keuangan/merchant_pencairan_berhasil_screen.dart';
import 'screens/profil_toko/merchant_profil_toko_screen.dart';
import 'screens/profil_toko/merchant_ubah_profil_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MajuRideMerchantApp());
}

/// Root Application MajuRide Merchant
/// Disesuaikan 1:1 dengan Page Figma: merchant MajuRide (Node 8644:1346)
class MajuRideMerchantApp extends StatelessWidget {
  const MajuRideMerchantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MajuRide Merchant',
      debugShowCheckedModeBanner: false,
      theme: MajuRideMerchantTheme.theme,
      // Langsung terbuka tampilan Splash Screen awal sesuai permintaan wajib user
      initialRoute: '/',
      routes: {
        '/': (context) => const MerchantSplashScreen(),
        '/splash': (context) => const MerchantSplashScreen(),
        '/welcome': (context) => const MerchantWelcomeScreen(),
        '/login': (context) => const MerchantLoginScreen(),
        '/otp': (context) {
          final phone = ModalRoute.of(context)?.settings.arguments as String?;
          return MerchantOtpScreen(phoneNumber: phone);
        },
        '/register': (context) => const MerchantRegisterScreen(),
        '/login_success': (context) => const MerchantLoginSuccessScreen(),
        '/main_nav': (context) => const MerchantMainNavigation(),
        '/dashboard': (context) => const MerchantDashboardScreen(),
        '/status_operasional': (context) => const MerchantStatusOperasionalScreen(),
        '/penyiapan_pesanan': (context) => const MerchantPenyiapanPesananScreen(),
        '/pengantaran_pesanan': (context) => const MerchantPengantaranPesananScreen(),
        '/kelola_menu': (context) => const MerchantKelolaMenuScreen(),
        '/tambah_menu': (context) => const MerchantTambahMenuScreen(),
        '/dompet': (context) => const MerchantDompetScreen(),
        '/performa_toko': (context) => const MerchantPerformaTokoScreen(),
        '/cairkan_saldo': (context) => const MerchantCairkanSaldoScreen(),
        '/pencairan_berhasil': (context) => const MerchantPencairanBerhasilScreen(),
        '/profil_toko': (context) => const MerchantProfilTokoScreen(),
        '/ubah_profil': (context) => const MerchantUbahProfilScreen(),
      },
    );
  }
}
