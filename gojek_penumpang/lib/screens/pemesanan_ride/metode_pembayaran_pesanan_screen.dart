import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import 'mencari_driver_screen.dart';
import 'qris_payment_screen.dart';

class MetodePembayaranPesananScreen extends StatefulWidget {
  final String serviceName;
  final String price;

  const MetodePembayaranPesananScreen({
    super.key,
    this.serviceName = 'MajuRide Standard',
    this.price = 'Rp 12.000',
  });

  @override
  State<MetodePembayaranPesananScreen> createState() =>
      _MetodePembayaranPesananScreenState();
}

class _MetodePembayaranPesananScreenState
    extends State<MetodePembayaranPesananScreen> {
  String _selectedMethod = 'Tunai';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MajuRideTheme.textDark),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/beranda');
            }
          },
        ),
        title: const Text(
          'Metode Pembayaran',
          style: TextStyle(
            color: MajuRideTheme.textDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Promo OVO Banner (Figma Node 8762:1266)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFD1FAE5).withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: MajuRideTheme.primaryGreen.withValues(alpha: 0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dapatkan hingga 0.5% dalam satu ketukan',
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: MajuRideTheme.textDark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: MajuRideTheme.cardBorder),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Text('🟣', style: TextStyle(fontSize: 20)),
                              SizedBox(width: 8),
                              Text(
                                'OVO',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: MajuRideTheme.textDark,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: MajuRideTheme.primaryGreen),
                            ),
                            child: const Text(
                              'Aktifkan',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: MajuRideTheme.primaryGreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Metode yang Sudah Terhubung
              const Text(
                'Metode yang Sudah Terhubung',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: MajuRideTheme.textDark,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Geser ke kiri untuk menyetel pembayaran utama',
                style: TextStyle(
                  fontSize: 11.5,
                  color: MajuRideTheme.textGrey,
                ),
              ),
              const SizedBox(height: 12),

              // Option 1: Tunai
              GestureDetector(
                onTap: () => setState(() => _selectedMethod = 'Tunai'),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: _selectedMethod == 'Tunai'
                          ? MajuRideTheme.primaryGreen
                          : MajuRideTheme.cardBorder,
                      width: _selectedMethod == 'Tunai' ? 1.5 : 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.payments,
                                  color: MajuRideTheme.primaryGreen, size: 22),
                              SizedBox(width: 10),
                              Text(
                                'Tunai',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: MajuRideTheme.textDark,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            _selectedMethod == 'Tunai'
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: MajuRideTheme.primaryGreen,
                          ),
                        ],
                      ),
                      if (_selectedMethod == 'Tunai') ...[
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: MajuRideTheme.primaryGreen,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Setel sebagai pembayaran utama',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Option 2: QRIS
              GestureDetector(
                onTap: () => setState(() => _selectedMethod = 'QRIS'),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: _selectedMethod == 'QRIS'
                          ? MajuRideTheme.primaryGreen
                          : MajuRideTheme.cardBorder,
                      width: _selectedMethod == 'QRIS' ? 1.5 : 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Text('⬛', style: TextStyle(fontSize: 18)),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'QRIS',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: MajuRideTheme.textDark,
                                    ),
                                  ),
                                  Text(
                                    'Pindai QR pengemudi untuk membayar',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: MajuRideTheme.textGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Icon(
                            _selectedMethod == 'QRIS'
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: MajuRideTheme.primaryGreen,
                          ),
                        ],
                      ),
                      if (_selectedMethod == 'QRIS') ...[
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: MajuRideTheme.buttonGrey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Pembayaran Utama Dipilih',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: MajuRideTheme.textGrey,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Tambahkan Metode
              const Text(
                'Tambahkan Metode',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: MajuRideTheme.textDark,
                ),
              ),
              const SizedBox(height: 10),
              _buildAddMethodTile(
                icon: Icons.sync,
                iconColor: MajuRideTheme.primaryGreen,
                title: 'Superbank',
              ),
              const SizedBox(height: 8),
              _buildAddMethodTile(
                icon: Icons.credit_card,
                iconColor: const Color(0xFF10B981),
                title: 'Kartu-Kartu',
              ),
              const SizedBox(height: 8),
              _buildAddMethodTile(
                icon: Icons.info_outline,
                iconColor: const Color(0xFF0284C7),
                title: 'i.saku',
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: MajuRideTheme.cardBorder)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Jumlah Tagihan',
                  style: TextStyle(
                    fontSize: 11,
                    color: MajuRideTheme.textGrey,
                  ),
                ),
                Text(
                  widget.price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: MajuRideTheme.textDark,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 140,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MajuRideTheme.primaryGreen,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  if (_selectedMethod == 'QRIS') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QrisPaymentScreen(
                          amount: widget.price,
                        ),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MencariDriverScreen(
                          fleetType: widget.serviceName,
                          price: widget.price,
                        ),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Pesan',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddMethodTile({
    required IconData icon,
    required Color iconColor,
    required String title,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: MajuRideTheme.cardBorder),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 20),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  color: MajuRideTheme.textDark,
                ),
              ),
            ],
          ),
          const Icon(Icons.chevron_right,
              size: 18, color: MajuRideTheme.textLight),
        ],
      ),
    );
  }
}
