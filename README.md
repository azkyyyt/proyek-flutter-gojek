# 🚀 Ekosistem Aplikasi Gojek (Flutter SuperApp)

Repositori ini berisi seluruh kode sumber (*source code*) lengkap untuk 3 aplikasi yang saling terintegrasi dalam ekosistem transportasi dan pemesanan online berbasis **Flutter**:

1. **`gojek_driver`** — Aplikasi Mitra Driver (Penerimaan order, navigasi rute penjemputan, verifikasi dokumen/profil, saldo dompet driver).
2. **`gojek_merchant`** — Aplikasi Mitra Toko/Restoran (Manajemen produk & menu, penyiapan pesanan, monitoring saldo & penarikan dana).
3. **`gojek_penumpang`** — Aplikasi Pengguna/Pelanggan (Pemesanan perjalanan motor/mobil, pesan makanan, dompet digital MajuPay, chat langsung dengan driver).

Seluruh kode telah diverifikasi, diperbaiki dari bug penumpukan UI, divalidasi dengan `flutter analyze` (**0 issues found**), dan siap dijalankan.

---

## 📁 Struktur Direktori

```text
proyek_flutter/
├── gojek_driver/       # Aplikasi Flutter untuk Mitra Driver
├── gojek_merchant/     # Aplikasi Flutter untuk Mitra Merchant / Resto
├── gojek_penumpang/    # Aplikasi Flutter untuk Pelanggan / Penumpang
└── README.md           # Dokumentasi utama proyek
```

---

## 🛠️ Prasyarat Lingkungan (*Environment Prerequisites*)

Sebelum menjalankan proyek, pastikan perangkat Anda telah terpasang:
* **Flutter SDK**: Versi `>= 3.24.0` (Direkomendasikan Flutter 3.47.x stable)
* **Dart SDK**: Terbawa otomatis bersama Flutter SDK
* **Android Studio & SDK**: Android SDK Platform Tools (API 33 Tiramisu)
* **Editor**: Visual Studio Code (dengan ekstensi Flutter & Dart) atau Android Studio

---

## 📱 Panduan Emulator Ringan (Rekomendasi Laptop RAM 8 GB)

Untuk laptop dengan RAM 8 GB (seperti Intel Core i7 11th Gen), sangat disarankan menggunakan spesifikasi emulator yang hemat sumber daya:

| Komponen | Nilai Rekomendasi | Keterangan |
| :--- | :--- | :--- |
| **Model Perangkat** | `Pixel 4a` | Resolusi seimbang, ringan |
| **System Image** | `Android 13.0 (API 33) Google APIs x86_64` | Stabil & jauh lebih ringan dari API 34+ |
| **RAM Emulator** | `2048 MB` (2 GB) | Pas: tidak membuat laptop freeze |
| **VM Heap** | `336 MB` | Optimal untuk rendering Flutter |
| **CPU Cores** | `4 Cores` | Booting kilat & kompilasi cepat |
| **Device Frame** | `Disabled` (`showDeviceFrame=no`) | Menghemat memori VGA laptop |
| **Graphics** | `Hardware - GLES 2.0 / Auto` | Akselerasi GPU Intel Iris Xe |

---

## 🚀 Cara Menjalankan Aplikasi

### 1. Kloning Repositori
```bash
git clone https://github.com/nurulaini23ag-cyber/proyek-flutter-gojek.git
cd proyek-flutter-gojek
```

### 2. Menjalankan Salah Satu Aplikasi (Contoh: Driver)
```bash
cd gojek_driver
flutter pub get
flutter run
```

### 3. Menjalankan Aplikasi Lainnya:
* **Merchant:**
  ```bash
  cd ../gojek_merchant
  flutter pub get
  flutter run
  ```
* **Penumpang:**
  ```bash
  cd ../gojek_penumpang
  flutter pub get
  flutter run
  ```

---

## 💡 Fitur Utama & Perbaikan Terakhir

* ✅ **Validasi Form Ketat**: Seluruh form input dan verifikasi mewajibkan data terisi lengkap sebelum tombol aksi dapat diklik.
* ✅ **Pembersihan Icon Ganda**: Memperbaiki avatar driver di halaman beranda dan profil agar foto tampil jernih tanpa logo *person* yang menumpuk di atas foto.
* ✅ **Optimasi Anti-Lag**: Emulator telah dikonfigurasikan agar responsif instan dan bebas notifikasi *Application Not Responding*.
* ✅ **Sinkronisasi Data Saldo**: Sistem kalkulasi dompet dan saldo merchant telah terhubung secara konsisten.

---

## 👨‍💻 Kontribusi & Lisensi
Proyek ini dibuat untuk keperluan pengembangan dan tugas akademik. Siapa pun dipersilakan untuk *clone*, *fork*, dan mengembangkan lebih lanjut!
