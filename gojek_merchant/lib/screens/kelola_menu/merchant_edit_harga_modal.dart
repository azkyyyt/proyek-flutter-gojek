import 'package:flutter/material.dart';
import '../../constants/majuride_merchant_theme.dart';

/// Modal: Ubah & Konfirmasi Pergantian Harga Menu
/// Node Figma: 9017:2066 & 9017:2167
class MerchantEditHargaModal extends StatefulWidget {
  final String menuName;
  final int currentPrice;
  final ValueChanged<int>? onPriceUpdated;

  const MerchantEditHargaModal({
    super.key,
    required this.menuName,
    required this.currentPrice,
    this.onPriceUpdated,
  });

  @override
  State<MerchantEditHargaModal> createState() => _MerchantEditHargaModalState();
}

class _MerchantEditHargaModalState extends State<MerchantEditHargaModal> {
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _priceController = TextEditingController(text: widget.currentPrice.toString());
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  void _showConfirmationDialog(int newPrice) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.info_outline_rounded, color: MajuRideMerchantTheme.primaryGreen),
            SizedBox(width: 8),
            Text(
              'Konfirmasi Harga',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Text(
          'Apakah Anda yakin ingin mengubah harga "${widget.menuName}" menjadi Rp $newPrice?',
          style: const TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 13,
            color: Color(0xFF334155),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text(
              'Batal',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w600,
                color: MajuRideMerchantTheme.textGrey,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx); // Close dialog
              Navigator.pop(context); // Close bottom sheet
              widget.onPriceUpdated?.call(newPrice);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Harga ${widget.menuName} berhasil diubah!'),
                  backgroundColor: MajuRideMerchantTheme.primaryGreen,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MajuRideMerchantTheme.primaryGreen,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Ya, Simpan'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 38,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Ubah Harga: ${widget.menuName}',
            style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: MajuRideMerchantTheme.textBlack,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Harga saat ini: Rp ${widget.currentPrice}',
            style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 13,
              color: MajuRideMerchantTheme.textGrey,
            ),
          ),
          const SizedBox(height: 18),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: MajuRideMerchantTheme.borderGrey),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Text(
                    'Rp',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: MajuRideMerchantTheme.textBlack,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: MajuRideMerchantTheme.primaryGreen,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final newP = int.tryParse(_priceController.text) ?? widget.currentPrice;
              _showConfirmationDialog(newP);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MajuRideMerchantTheme.primaryGreen,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Perbarui Harga Menu',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
