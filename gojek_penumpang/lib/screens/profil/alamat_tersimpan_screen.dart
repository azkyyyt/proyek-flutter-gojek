import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';

class AlamatTersimpanScreen extends StatelessWidget {
  const AlamatTersimpanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addresses = [
      {
        'title': 'Rumah Utama',
        'address': 'Jl. Kemang Raya No. 45 RT 02/05, Mampang Prapatan, Jakarta Selatan',
        'icon': Icons.home_rounded,
        'tag': 'Utama',
      },
      {
        'title': 'Kantor Pusat',
        'address': 'Menara BCA Lt. 28, Jl. M.H. Thamrin No. 1, Menteng, Jakarta Pusat',
        'icon': Icons.work_rounded,
        'tag': 'Kantor',
      },
      {
        'title': 'Kos Kemanggisan',
        'address': 'Jl. Anggrek Cakra No. 12, Kebon Jeruk, Jakarta Barat',
        'icon': Icons.apartment_rounded,
        'tag': 'Tempat Singgah',
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
          'Alamat Tersimpan',
          style: TextStyle(
            color: MajuRideTheme.textDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: addresses.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = addresses[index];
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: MajuRideTheme.surfaceWhite,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: MajuRideTheme.cardBorder),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: MajuRideTheme.lightGreen,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(item['icon'] as IconData, color: MajuRideTheme.darkGreen, size: 22),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    item['title'] as String,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: MajuRideTheme.bgGrey,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      item['tag'] as String,
                                      style: const TextStyle(fontSize: 10, color: MajuRideTheme.textGrey, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['address'] as String,
                                style: const TextStyle(fontSize: 12.5, color: MajuRideTheme.textGrey, height: 1.3),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.more_vert, size: 18, color: MajuRideTheme.textLight),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom Add Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MajuRideTheme.primaryGreen,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(Icons.add_location_alt_rounded),
                  label: const Text('Tambah Alamat Baru', style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Membuka form penambahan alamat baru'),
                        backgroundColor: MajuRideTheme.primaryGreen,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
