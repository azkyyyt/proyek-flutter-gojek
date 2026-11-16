import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';

class PusatBantuanScreen extends StatelessWidget {
  const PusatBantuanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      {
        'q': 'Bagaimana cara membatalkan pesanan MajuRide?',
        'a': 'Anda dapat membatalkan pesanan sebelum driver tiba di lokasi penjemputan dengan menekan tombol "Batalkan Pesanan" di layar pencarian atau layar pelacakan driver.',
      },
      {
        'q': 'Bagaimana cara mengisi saldo MajuPay?',
        'a': 'Pilih menu "Dompet MajuPay" di beranda atau profil, lalu tekan tombol "Isi Saldo / Top Up". Anda dapat memilih Virtual Account BCA, Mandiri, atau BRI.',
      },
      {
        'q': 'Barang saya tertinggal di motor/mobil driver, apa yang harus dilakukan?',
        'a': 'Buka menu Aktivitas, pilih perjalanan terakhir Anda, dan tekan tombol "Laporkan Barang Tertinggal" atau hubungi CS kami melalui WhatsApp di bawah.',
      },
      {
        'q': 'Apakah tarif perjalanan sudah termasuk biaya tol?',
        'a': 'Untuk layanan MajuCar mobil, biaya tol dibayarkan secara langsung atau ditambahkan ke tagihan sesuai rute yang disepakati dengan driver.',
      },
    ];

    return Scaffold(
      backgroundColor: MajuRideTheme.bgGrey,
      appBar: AppBar(
        backgroundColor: MajuRideTheme.surfaceWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MajuRideTheme.textDark),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/profil');
            }
          },
        ),
        title: const Text(
          'Pusat Bantuan & CS',
          style: TextStyle(
            color: MajuRideTheme.textDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // CS Contact Card
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: MajuRideTheme.primaryGreen,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Butuh Bantuan Cepat?',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Tim Customer Care MajuRide siap membantu Anda 24/7.',
                    style: TextStyle(color: Colors.white70, fontSize: 12.5),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: MajuRideTheme.darkGreen,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          icon: const Icon(Icons.chat_bubble_outline_rounded, size: 18),
                          label: const Text('Chat WA CS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Membuka WhatsApp Customer Care MajuRide'),
                                backgroundColor: MajuRideTheme.primaryGreen,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white70),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          icon: const Icon(Icons.email_outlined, size: 18),
                          label: const Text('Email CS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Membuka email ke support@majuride.com'),
                                backgroundColor: MajuRideTheme.primaryGreen,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'Pertanyaan Sering Diajukan (FAQ)',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: MajuRideTheme.textDark),
            ),
            const SizedBox(height: 10),

            ...faqs.map((faq) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: MajuRideTheme.surfaceWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: MajuRideTheme.cardBorder),
                ),
                child: ExpansionTile(
                  iconColor: MajuRideTheme.primaryGreen,
                  collapsedIconColor: MajuRideTheme.textGrey,
                  title: Text(
                    faq['q']!,
                    style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold, color: MajuRideTheme.textDark),
                  ),
                  childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  children: [
                    Text(
                      faq['a']!,
                      style: const TextStyle(fontSize: 12.5, color: MajuRideTheme.textGrey, height: 1.4),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
