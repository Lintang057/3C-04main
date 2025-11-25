import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../widgets/product_tile.dart';
import 'product_detail.dart';
import 'cart_page.dart';

class ProductsPage extends StatelessWidget {
  static const routeName = '/products';
  const ProductsPage({super.key});

  // demo product list (ganti/isi dari PDF jika mau)
  List<Product> _demoProducts() => [
    Product(id: 'p1', name: 'Croissant', description: 'Renyah & buttery.', price: 12000, image: 'assets/image/croissant.png'),
    Product(id: 'p2', name: 'Roti Tawar', description: 'Lembut, pas untuk sarapan.', price: 15000, image: 'assets/image/bread.png'),
    Product(id: 'p3', name: 'Cupcake Cokelat', description: 'Manis & moist.', price: 18000, image: 'assets/image/cupcake.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final products = _demoProducts();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Roti'),
        actions: [
          IconButton(onPressed: ()=> Navigator.pushNamed(context, CartPage.routeName), icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (ctx,i) {
            final p = products[i];
            return ProductTile(
              product: p,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetail(product: p))),
              onAdd: () => Provider.of<CartProvider>(context, listen: false).add(p),
            );
          },
        ),
      ),
    );
  }
}
