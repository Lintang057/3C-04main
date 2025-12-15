import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  static const routeName = '/detail';
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E9DD), 
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B4513), 
        title: const Text(
          'Detail Produk',
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
              // Header
              const Text(
                'detail produk',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B4513),
                ),
              ),
              const SizedBox(height: 16),

              // Product Title
              const Text(
                'The Cowboy Cookie',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),

              // Product Description
              const Text(
                'Biskuit gurih besar dengan tekstur renyah di luar, lembut di dalam.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),

              // Detail Section
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
                      'Detail:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8B4513),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Detail: Cookie/Biskuit besar dengan tema "The Cowboy." Memiliki perpaduan rasa gurih mentega, sedikit asin, dan manis yang pas. Cocok untuk teman minum kopi atau teh. Varian isi : chocolate chip besar, oatmeal, atau kacang.',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Categories
              Wrap(
                spacing: 8,
                children: [
                  Chip(
                    backgroundColor: const Color(0xFF8B4513),
                    label: const Text(
                      'Kue Kering',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Chip(
                    backgroundColor: const Color(0xFF8B4513),
                    label: const Text(
                      'Biskuit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Chip(
                    backgroundColor: const Color(0xFF8B4513),
                    label: const Text(
                      'Teman Kopi',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Divider
              Container(
                height: 1,
                color: const Color(0xFF8B4513),
              ),
              const SizedBox(height: 16),

              // Add Purchase Section
              const Center(
                child: Text(
                  'Tambah Pembelian',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8B4513),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}