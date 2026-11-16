import 'package:flutter/foundation.dart';

/// Service Singleton untuk mengelola saldo Dompet NusaMerchant secara reaktif
class MerchantWalletService {
  static final MerchantWalletService _instance = MerchantWalletService._internal();
  factory MerchantWalletService() => _instance;
  MerchantWalletService._internal();

  /// Saldo awal default sesuai Figma: Rp 256.000
  final ValueNotifier<int> saldoNotifier = ValueNotifier<int>(256000);

  int get saldo => saldoNotifier.value;

  int lastNominalDitarik = 200000;
  int lastSisaSaldo = 56000;

  /// Melakukan penarikan saldo dan memperbarui saldo toko secara realtime
  bool withdraw(int amount) {
    if (amount <= 0 || amount > saldoNotifier.value) {
      return false;
    }
    lastNominalDitarik = amount;
    saldoNotifier.value -= amount;
    lastSisaSaldo = saldoNotifier.value;
    return true;
  }

  /// Reset ke saldo awal (jika saldo habis atau ingin menguji ulang prototype)
  void resetToDefault() {
    saldoNotifier.value = 256000;
    lastNominalDitarik = 200000;
    lastSisaSaldo = 56000;
  }

  /// Format angka ke format Rupiah standar (contoh: 256000 -> "256.000")
  static String formatRupiah(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }

  /// Parsing teks (contoh: "100.000" atau "100000") menjadi integer
  static int parseNominal(String text) {
    final clean = text.replaceAll(RegExp(r'[^\d]'), '');
    return int.tryParse(clean) ?? 0;
  }
}
