import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart';
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: cart.items.isEmpty
            ? const Center(child: Text('Keranjang kosong'))
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (c,i){
                        final it = cart.items[i];
                        return ListTile(
                          leading: Image.asset(it.product.image, width: 56, height: 56, fit: BoxFit.cover, errorBuilder: (c,e,s)=> const FlutterLogo(size:56)),
                          title: Text(it.product.name),
                          subtitle: Text('Rp ${it.product.price.toStringAsFixed(0)} x ${it.qty}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(onPressed: ()=> cart.removeSingle(it.product), icon: const Icon(Icons.remove)),
                              Text('${it.qty}'),
                              IconButton(onPressed: ()=> cart.add(it.product), icon: const Icon(Icons.add)),
                            ],
                          ),
                        );
                      }
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Total: Rp ${cart.totalPrice.toStringAsFixed(0)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // demo checkout
                        showDialog(context: context, builder: (_) => AlertDialog(
                          title: const Text('Checkout'),
                          content: Text('Total yang harus dibayar: Rp ${cart.totalPrice.toStringAsFixed(0)}\nLanjutkan checkout (demo)?'),
                          actions: [
                            TextButton(onPressed: ()=> Navigator.pop(context), child: const Text('Batal')),
                            ElevatedButton(onPressed: (){
                              cart.clear();
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pesanan dibuat (demo)')));
                              Navigator.pop(context); // kembali ke halaman sebelumnya
                            }, child: const Text('Bayar')),
                          ],
                        ));
                      },
                      child: const Text('Checkout'),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
