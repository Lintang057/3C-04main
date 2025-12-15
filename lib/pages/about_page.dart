import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const routeName = '/AboutPage';
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E9DD),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B4513),
        title: const Text(
          'Tentang Kami',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // About Section
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFF8B4513)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8B4513),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Semua dimulai di dapur kecil [Tahun Berdiri] dengan satu resep andalan [Sebutkan produk unggulan, contoh: Croissant mentega Prancis]. Seiring berjalannya waktu, toko kami di [Nama Kota/Lokasi] menjadi rumah bagi para pecinta roti. Kini, melalui aplikasi ini, kami memperluas dapur kami untuk melayani Anda kapan saja dan di mana saja. Kami menjaga kualitas bahan, proses, dan setiap gigitan, seperti kami membuatnya untuk keluarga sendiri.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Keunggulan Agilbazi
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFF8B4513)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Keunggulan Aplikasi',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8B4513),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Aplikasi A Bakery’s dirancang untuk membuat pengalaman belanja roti Anda semakin manis.',                      
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    Text(
                      'Selalu Fresh: Pesan kapan saja dan dapatkan notifikasi saat roti favorit Anda baru dipanggang.',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    Text(
                      'Pesan Antar Kilat: Nikmati layanan pengiriman cepat dari toko terdekat langsung ke pintu Anda.',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    Text(
                      'Loyalitas yang Manis: Kumpulkan poin untuk setiap pembelian dan tukarkan dengan diskon atau produk gratis.',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    Text(
                      'Menu Eksklusif: Akses menu musiman dan edisi terbatas yang hanya tersedia di aplikasi.',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    SizedBox(height: 12),
                    _FeatureItem(
                      icon: Icons.thumb_up,
                      text: 'Aplikasi A Bakerys dirancang untuk membuat pengalaman belanja roti Anda semakin manis.',
                    ),
                    _FeatureItem(
                      icon: Icons.thumb_up,
                      text: 'Selalu Fresh: Pesan kapan saja dan dapatkan notifikasi saat roti favorit Anda baru dipanggang.',
                    ),
                    _FeatureItem(
                      icon: Icons.local_shipping,
                      text: 'Pesan Antar Kilat: Nikmati layanan pengiriman cepat dari toko terdekat langsung ke pintu Anda.',
                    ),
                    _FeatureItem(
                      icon: Icons.security,
                      text: 'Loyalitas yang Manis: Kumpulkan poin untuk setiap pembelian dan tukarkan dengan diskon atau produk gratis.',
                      ),
                    _FeatureItem(
                      icon: Icons.star,
                      text: 'Menu Eksklusif: Akses menu musiman dan edisi terbatas yang hanya tersedia di aplikasi.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Nishi Nishi Kan Section
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFF8B4513)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nilai Nilai Kami',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8B4513),
                      ),
                    ),
                    SizedBox(height: 12),
                    _QualityItem(
                      text: 'Kualitas Tanpa Kompromi: Hanya menggunakan bahan-bahan terbaik.',
                    ),
                    _QualityItem(
                      text: 'Komunitas: Berusaha menjadi bagian penting dari lingkungan sekitar dan mendukung petani lokal.',
                    ),
                    _QualityItem(
                      text: 'Inovasi: Selalu mencari resep baru dan cara terbaik untuk melayani Anda.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFF8B4513),
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}

class _QualityItem extends StatelessWidget {
  final String text;

  const _QualityItem({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle,
            color: Color(0xFF8B4513),
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}