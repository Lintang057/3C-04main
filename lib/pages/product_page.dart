import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import 'product_detail.dart';

class ProductsPage extends StatelessWidget {
  static const routeName = '/products';
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Product.sampleData; // ambil data dummy

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu Premium',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(18),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];

          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetail(product: p),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),

                  // Gambar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      p.image,
                      height: 110,
                      width: 110,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Nama
                  Text(
                    p.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 6),

                  // Harga
                  Text(
                    'Rp ${p.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFFB86946),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Spacer(),

                  // Tombol Beli
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB86946),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false).addToCart(p);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${p.name} ditambahkan ke keranjang')),
                          );
                        },
                        child: const Text(
                          'Beli',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
