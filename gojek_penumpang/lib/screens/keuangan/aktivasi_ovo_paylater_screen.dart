import 'package:flutter/material.dart';
import '../../theme/majuride_theme.dart';

class AktivasiOvoPayLaterScreen extends StatefulWidget {
  const AktivasiOvoPayLaterScreen({super.key});

  @override
  State<AktivasiOvoPayLaterScreen> createState() => _AktivasiOvoPayLaterScreenState();
}

class _AktivasiOvoPayLaterScreenState extends State<AktivasiOvoPayLaterScreen> {
  bool _agreed = true;
  bool _isSubmitting = false;

  void _onAjukan() {
    if (!_agreed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap centang persetujuan syarat & ketentuan'),
          backgroundColor: Color(0xFFEF4444),
        ),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      setState(() {
        _isSubmitting = false;
      });

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (ctx) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 48,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: 72,
                height: 72,
                decoration: const BoxDecoration(
                  color: Color(0xFFECFDF5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: Color(0xFF10B981),
                  size: 48,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Pengajuan Terkirim!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: MajuRideTheme.textDark,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Data pengajuan OVO PayLater Anda sedang diverifikasi. Hasil akan diberitahukan dalam 5-10 menit.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.5,
                  color: MajuRideTheme.textGrey,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4C3494),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.pop(ctx);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Selesai & Kembali ke Keuangan',
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MajuRideTheme.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFF4C3494),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'OVO',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'PayLater',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0F172A),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hero Limit Card (OVO Theme Purple & Gold)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF4C3494), Color(0xFF6B46C1)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF4C3494).withValues(alpha: 0.35),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.bolt_rounded,
                                        color: Color(0xFFFDE047), size: 16),
                                    SizedBox(width: 4),
                                    Text(
                                      'Aktivasi Instan',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Text(
                                'Bunga 0%',
                                style: TextStyle(
                                  color: Color(0xFFFDE047),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          const Text(
                            'Dapatkan Limit Hingga',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Rp 25.000.000',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 14),
                          const Divider(color: Colors.white24, height: 1),
                          const SizedBox(height: 12),
                          const Text(
                            'Bisa dipakai untuk MajuRide, MajuFood, dan bayar QRIS di mana saja.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Section: Keuntungan OVO PayLater
                    const Text(
                      'Keuntungan OVO PayLater',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 14),

                    _buildBenefitItem(
                      icon: Icons.calendar_month_rounded,
                      iconBg: const Color(0xFFF3E8FF),
                      iconColor: const Color(0xFF7C3AED),
                      title: 'Beli Sekarang, Bayar Akhir Bulan',
                      subtitle:
                          'Tanpa bunga jika dibayar lunas pada tanggal jatuh tempo tiap bulannya.',
                    ),
                    const SizedBox(height: 12),
                    _buildBenefitItem(
                      icon: Icons.credit_score_rounded,
                      iconBg: const Color(0xFFDCFCE7),
                      iconColor: const Color(0xFF16A34A),
                      title: 'Cicilan Ringan Tenor Fleksibel',
                      subtitle:
                          'Pilihan cicilan 3, 6, hingga 12 bulan dengan cicilan terjangkau.',
                    ),
                    const SizedBox(height: 12),
                    _buildBenefitItem(
                      icon: Icons.security_rounded,
                      iconBg: const Color(0xFFE0F2FE),
                      iconColor: const Color(0xFF0284C7),
                      title: 'Aman & Terdaftar di OJK',
                      subtitle:
                          'Layanan pembiayaan resmi berizin dan diawasi oleh Otoritas Jasa Keuangan.',
                    ),

                    const SizedBox(height: 24),

                    // Syarat Dokumen
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: MajuRideTheme.cardBorder),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Syarat Dokumen Pengajuan',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildDocRow('Warga Negara Indonesia (WNI) min. 21 tahun'),
                          const SizedBox(height: 8),
                          _buildDocRow('e-KTP asli yang masih berlaku'),
                          const SizedBox(height: 8),
                          _buildDocRow('Nomor HP aktif yang terdaftar di OVO'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Checkbox Persetujuan
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: _agreed,
                            activeColor: const Color(0xFF4C3494),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            onChanged: (val) {
                              setState(() {
                                _agreed = val ?? false;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text(
                            'Saya menyetujui Syarat & Ketentuan serta Kebijakan Privasi aktivasi layanan OVO PayLater.',
                            style: TextStyle(
                              fontSize: 12,
                              color: MajuRideTheme.textGrey,
                              height: 1.35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Sticky Button
            Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4C3494),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  onPressed: _isSubmitting ? null : _onAjukan,
                  child: _isSubmitting
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5,
                          ),
                        )
                      : const Text(
                          'Daftar & Aktifkan OVO PayLater',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitItem({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: MajuRideTheme.cardBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: MajuRideTheme.textGrey,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocRow(String text) {
    return Row(
      children: [
        const Icon(Icons.check_circle_outline_rounded,
            size: 16, color: Color(0xFF10B981)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12.5,
              color: Color(0xFF334155),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
