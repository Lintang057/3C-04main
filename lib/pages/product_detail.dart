import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(product.image, width: double.infinity, height: 220, fit: BoxFit.cover, errorBuilder: (c,e,s)=> const FlutterLogo(size:180)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                  Text('Rp ${product.price.toStringAsFixed(0)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                ],
              ),
              const SizedBox(height: 8),
              Text(product.description, style: const TextStyle(fontSize: 15)),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false).add(product);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ditambahkan ke keranjang')));
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Tambah ke Keranjang'),
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
