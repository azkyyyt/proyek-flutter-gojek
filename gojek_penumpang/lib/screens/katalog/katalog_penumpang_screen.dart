import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';

// Import Semua Layar Penumpang
import '../autentikasi/splash_screen.dart';
import '../autentikasi/login_screen.dart';
import '../autentikasi/registrasi_screen.dart';
import '../autentikasi/verifikasi_otp_screen.dart';
import '../autentikasi/masuk_password_screen.dart';
import '../autentikasi/lupa_password_screen.dart';
import '../autentikasi/atur_ulang_password_screen.dart';
import '../autentikasi/lengkapi_profil_screen.dart';

import '../beranda/beranda_penumpang_screen.dart';
import '../beranda/promo_diskon_screen.dart';
import '../beranda/scan_qr_screen.dart';

import '../pemesanan_ride/pemilihan_lokasi_screen.dart';
import '../pemesanan_ride/peta_penentuan_lokasi_screen.dart';
import '../pemesanan_ride/pilihan_layanan_tarif_screen.dart';
import '../pemesanan_ride/mencari_driver_screen.dart';
import '../pemesanan_ride/driver_ditemukan_screen.dart';
import '../pemesanan_ride/dalam_perjalanan_screen.dart';
import '../pemesanan_ride/rating_ulasan_screen.dart';

import '../pemesanan_food/daftar_menu_makanan_screen.dart';
import '../pemesanan_food/checkout_makanan_screen.dart';

import '../keuangan/dompet_majupay_screen.dart';
import '../keuangan/masukkan_pin_screen.dart';
import '../keuangan/pembayaran_selesai_screen.dart';

import '../aktivitas/riwayat_aktivitas_screen.dart';
import '../aktivitas/detail_transaksi_screen.dart';

import '../pesan/kotak_masuk_screen.dart';
import '../pesan/chat_driver_screen.dart';

import '../profil/profil_penumpang_screen.dart';
import '../profil/edit_profil_screen.dart';
import '../profil/alamat_tersimpan_screen.dart';
import '../profil/pusat_bantuan_screen.dart';

class KatalogPenumpangScreen extends StatelessWidget {
  const KatalogPenumpangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MajuRideTheme.bgGrey,
      appBar: AppBar(
        backgroundColor: MajuRideTheme.surfaceWhite,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Katalog Layar MajuRide Penumpang',
              style: TextStyle(
                color: MajuRideTheme.textDark,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Aplikasi Ojek Online • Kategori Terstruktur',
              style: TextStyle(color: MajuRideTheme.textGrey, fontSize: 11),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Welcome Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: MajuRideTheme.primaryGreen,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.directions_bike_rounded, color: Colors.white, size: 36),
                  SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MajuRide Penumpang Siap!',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Seluruh layar telah dikelompokkan sesuai fungsinya. Klik tombol mana saja untuk menguji layarnya.',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _buildSection(
              context,
              categoryTitle: '1. Autentikasi & Akun',
              categoryIcon: Icons.lock_outline_rounded,
              color: const Color(0xFF0284C7),
              screens: [
                _Item('Splash Screen (Opening)', 'Logo & Tagline MajuRide', const SplashScreen()),
                _Item('Login Penumpang', 'Input Nomor HP / Email', const LoginScreen()),
                _Item('Registrasi Akun Baru', 'Form pendaftaran penumpang', const RegistrasiScreen()),
                _Item('Verifikasi OTP (Interaktif)', 'Input 6 Digit PIN SMS & Timer', const VerifikasiOTPScreen()),
                _Item('Masuk dengan Password', 'Login kata sandi & show/hide', const MasukPasswordScreen()),
                _Item('Lupa Password', 'Pemulihan akun via email/HP', const LupaPasswordScreen()),
                _Item('Atur Ulang Password', 'Buat sandi baru & konfirmasi', const AturUlangPasswordScreen()),
                _Item('Lengkapi Profil Awal', 'Foto avatar kotak & biodata', const LengkapiProfilScreen()),
              ],
            ),

            _buildSection(
              context,
              categoryTitle: '2. Beranda & Promo',
              categoryIcon: Icons.home_rounded,
              color: MajuRideTheme.primaryGreen,
              screens: [
                _Item('Beranda Penumpang (Dashboard)', 'Saldo MajuPay & 4 Layanan Utama', const BerandaPenumpangScreen()),
                _Item('Promo & Voucher Diskon', 'Daftar kode promo & cashback', const PromoDiskonScreen()),
                _Item('Pindai QRIS MajuPay', 'Scan QR bayar merchant instan', const ScanQrScreen()),
              ],
            ),

            _buildSection(
              context,
              categoryTitle: '3. Pemesanan Ojek & Mobil (Ride)',
              categoryIcon: Icons.two_wheeler_rounded,
              color: const Color(0xFFD97706),
              screens: [
                _Item('Pemilihan Lokasi & Tujuan', 'Input jemput & tujuan favorit', const PemilihanLokasiScreen()),
                _Item('Peta Penentuan Lokasi', 'Geser peta & pasang pin poin', const PetaPenentuanLokasiScreen()),
                _Item('Pilihan Layanan & Tarif', 'MajuRide Motor vs MajuCar Mobil', const PilihanLayananTarifScreen()),
                _Item('Mencari Driver (Radar)', 'Animasi radar mencari armada', const MencariDriverScreen(
                  fleetType: 'MajuRide',
                  price: 'Rp 14.000',
                  pickupLocation: 'Grand Indonesia',
                  destinationLocation: 'Stasiun Gambir',
                )),
                _Item('Driver Menuju Titik Jemput', 'Data driver Budi Santoso & ETA', const DriverDitemukanScreen(
                  fleetType: 'MajuRide',
                  price: 'Rp 14.000',
                  pickupLocation: 'Grand Indonesia',
                  destinationLocation: 'Stasiun Gambir',
                )),
                _Item('Dalam Perjalanan', 'Rute aktif & ETA 12 menit', const DalamPerjalananScreen()),
                _Item('Beri Ulasan & Rating', 'Bintang 1-5 interaktif & chips', const RatingUlasanScreen()),
              ],
            ),

            _buildSection(
              context,
              categoryTitle: '4. Pemesanan Makanan (MajuFood)',
              categoryIcon: Icons.restaurant_rounded,
              color: const Color(0xFFDC2626),
              screens: [
                _Item('Daftar Menu Makanan', 'Ayam Geprek, Dimsum, Mochi, Cimol', const DaftarMenuMakananScreen()),
                _Item('Checkout & Pembayaran Food', 'Rincian menu, ongkir, diskon', const CheckoutMakananScreen(totalPrice: 27000, totalItems: 2)),
              ],
            ),

            _buildSection(
              context,
              categoryTitle: '5. Keuangan & Dompet (MajuPay)',
              categoryIcon: Icons.account_balance_wallet_rounded,
              color: const Color(0xFF059669),
              screens: [
                _Item('Dompet MajuPay', 'Saldo, Top Up, Transfer, Mutasi', const DompetMajupayScreen()),
                _Item('Masukkan PIN 6-Digit (Keypad)', 'Input PIN dinamis 1 layar', const MasukkanPinScreen()),
                _Item('Pembayaran Selesai (Struk)', 'Bukti pembayaran transaksi sukses', const PembayaranSelesaiScreen()),
              ],
            ),

            _buildSection(
              context,
              categoryTitle: '6. Aktivitas & Riwayat Transaksi',
              categoryIcon: Icons.receipt_long_rounded,
              color: const Color(0xFF4F46E5),
              screens: [
                _Item('Riwayat Aktivitas', 'Tab Berlangsung & Riwayat Selesai', const RiwayatAktivitasScreen()),
                _Item('Detail Transaksi Selesai', 'Rincian lengkap order masa lalu', const DetailTransaksiScreen()),
              ],
            ),

            _buildSection(
              context,
              categoryTitle: '7. Pesan & Komunikasi',
              categoryIcon: Icons.chat_bubble_outline_rounded,
              color: const Color(0xFF0D9488),
              screens: [
                _Item('Kotak Masuk', 'Tab Chat & Notifikasi Sistem', const KotakMasukScreen()),
                _Item('Chat Driver Realtime', 'Kirim pesan & quick reply bubble', const ChatDriverScreen()),
              ],
            ),

            _buildSection(
              context,
              categoryTitle: '8. Profil & Bantuan',
              categoryIcon: Icons.person_outline_rounded,
              color: const Color(0xFF7C3AED),
              screens: [
                _Item('Profil Penumpang', 'Biodata akun, menu pengaturan', const ProfilPenumpangScreen()),
                _Item('Edit Profil Pribadi', 'Ubah nama, nomor HP, email', const EditProfilScreen()),
                _Item('Alamat Tersimpan', 'Kelola alamat Rumah, Kantor, Kos', const AlamatTersimpanScreen()),
                _Item('Pusat Bantuan & CS', 'FAQ & Tombol Chat WhatsApp CS', const PusatBantuanScreen()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String categoryTitle,
    required IconData categoryIcon,
    required Color color,
    required List<_Item> screens,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: MajuRideTheme.surfaceWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: MajuRideTheme.cardBorder),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: true,
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(categoryIcon, color: color, size: 20),
          ),
          title: Text(
            categoryTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5),
          ),
          subtitle: Text(
            '${screens.length} Layar Siap Pakai',
            style: const TextStyle(fontSize: 11.5, color: MajuRideTheme.textGrey),
          ),
          children: screens.map((s) {
            return ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              title: Text(s.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              subtitle: Text(s.subtitle, style: const TextStyle(fontSize: 11.5, color: MajuRideTheme.textGrey)),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MajuRideTheme.primaryGreen,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => s.page),
                  );
                },
                child: const Text('Buka', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _Item {
  final String title;
  final String subtitle;
  final Widget page;

  _Item(this.title, this.subtitle, this.page);
}
