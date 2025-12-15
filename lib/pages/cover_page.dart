// lib/pages/cover_page.dart
import 'package:flutter/material.dart';

class CoverPage extends StatelessWidget {
  static const routeName = '/cover';
  const CoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    // warna tema yang konsisten dengan desain login
    const Color primary = Color(0xFFB86946); // warm brown
    const Color dark = Color(0xFF4E2F28);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFBF7F5), Color(0xFFFFF8F6)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 48),

              // Logo besar di tengah atas
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Center(
                  // ganti dengan Image.asset('assets/image/logo.png') jika punya file
                  child: Icon(Icons.eco_outlined, size: 56, color: Colors.white),
                ),
              ),

              const SizedBox(height: 28),

              // Judul besar
              const Text(
                'Nama Aplikasi',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  color: dark,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              // Subtitle / tagline
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 36.0),
                child: Text(
                  'Solusi mudah untuk kebutuhan Anda — cepat, aman, dan terpercaya.',
                  style: TextStyle(fontSize: 15, color: Colors.black54, height: 1.3),
                  textAlign: TextAlign.center,
                ),
              ),

              const Spacer(),

              // Card pendek menonjol di bagian tengah-bawah (opsional: highlights)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
                    child: Row(
                      children: const [
                        Icon(Icons.star_rate, color: Color(0xFFB86946)),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Mulai sekarang — daftar cepat dan dapatkan fitur premium 7 hari gratis.',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Tombol CTA utama: Get Started / Login
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      // contoh: langsung ke halaman login
                      Navigator.pushNamed(context, '/'); // asumsi LoginPage di route '/'
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    child: const Text(
                      'Mulai Sekarang',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Tombol sekunder (bisa jadi Login)
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/'); // kembali ke login
                },
                child: const Text(
                  'Sudah punya akun? Masuk',
                  style: TextStyle(color: dark),
                ),
              ),

              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}
