import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';
import '../keuangan/pembayaran_selesai_screen.dart';

class CheckoutMakananScreen extends StatefulWidget {
  final int totalPrice;
  final int totalItems;

  const CheckoutMakananScreen({
    super.key,
    required this.totalPrice,
    required this.totalItems,
  });

  @override
  State<CheckoutMakananScreen> createState() => _CheckoutMakananScreenState();
}

class _CheckoutMakananScreenState extends State<CheckoutMakananScreen> {
  final int _deliveryFee = 8000;
  final int _voucherDiscount = 5000;
  String _paymentMethod = 'MajuPay (Rp 75.500)';

  int get _finalTotal => widget.totalPrice + _deliveryFee - _voucherDiscount;

  @override
  Widget build(BuildContext context) {
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
              Navigator.pushReplacementNamed(context, '/beranda');
            }
          },
        ),
        title: const Text(
          'Konfirmasi Pesanan Makanan',
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
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Alamat Antar
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: MajuRideTheme.surfaceWhite,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: MajuRideTheme.cardBorder),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on, color: MajuRideTheme.redDanger, size: 20),
                            SizedBox(width: 8),
                            Text('Alamat Pengantaran', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text('Rumah (Ahmad Pratama)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        SizedBox(height: 2),
                        Text(
                          'Jl. Kemang Raya No. 45 RT 02/05, Jakarta Selatan (Pagar hitam samping minimarket)',
                          style: TextStyle(fontSize: 12.5, color: MajuRideTheme.textGrey, height: 1.3),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Ringkasan Restoran & Menu
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: MajuRideTheme.surfaceWhite,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: MajuRideTheme.cardBorder),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Dapur Narawi Spesial',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const Divider(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${widget.totalItems}x Menu Pilihan', style: const TextStyle(fontSize: 13)),
                            Text('Rp ${widget.totalPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Biaya Ongkos Kirim', style: TextStyle(fontSize: 13)),
                            Text('Rp 8.000', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Diskon Voucher KENYANGHEMAT', style: TextStyle(fontSize: 13, color: MajuRideTheme.primaryGreen)),
                            Text('- Rp 5.000', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: MajuRideTheme.primaryGreen)),
                          ],
                        ),
                        const Divider(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total Pembayaran', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5)),
                            Text(
                              'Rp ${_finalTotal.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: MajuRideTheme.darkGreen,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Order Action
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: MajuRideTheme.surfaceWhite,
                border: Border(top: BorderSide(color: MajuRideTheme.cardBorder)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.account_balance_wallet_rounded, color: MajuRideTheme.primaryGreen, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            _paymentMethod,
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _paymentMethod = _paymentMethod.contains('MajuPay')
                                ? 'Tunai (Cash)'
                                : 'MajuPay (Rp 75.500)';
                          });
                        },
                        child: const Text('Ganti', style: TextStyle(color: MajuRideTheme.darkGreen)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MajuRideTheme.primaryGreen,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PembayaranSelesaiScreen(
                              merchantName: 'Dapur Narawi Spesial',
                              amount: 'Rp ${_finalTotal.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}',
                              serviceType: 'Pesanan MajuFood',
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Pesan & Bayar Sekarang',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
