// lib/providers/cart_provider.dart
import 'package:flutter/material.dart';
import '../models/product.dart';

class CartItem {
  final Product product;
  int qty;
  CartItem({required this.product, this.qty = 1});
}

class CartProvider extends ChangeNotifier {
  // gunakan product.name sebagai key agar kompatibel jika Product tidak punya id
  final Map<String, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();

  int get totalItems => _items.values.fold(0, (s, i) => s + i.qty);

  double get totalPrice => _items.values.fold(0.0, (s, i) => s + i.qty * (i.product.price));

  // Nama metode utama: add (tambah 1 unit)
  void add(Product p) {
    final key = _keyFor(p);
    if (_items.containsKey(key)) {
      _items[key]!.qty += 1;
    } else {
      _items[key] = CartItem(product: p, qty: 1);
    }
    notifyListeners();
  }

  // Alias supaya kode lama yang memanggil addToCart tetap bekerja
  void addToCart(Product p) => add(p);

  // Kurangi satu unit (jika 1 -> hapus)
  void removeSingle(Product p) {
    final key = _keyFor(p);
    if (!_items.containsKey(key)) return;
    if (_items[key]!.qty > 1) {
      _items[key]!.qty -= 1;
    } else {
      _items.remove(key);
    }
    notifyListeners();
  }

  // Hapus semua item untuk product
  void removeAll(Product p) {
    final key = _keyFor(p);
    _items.remove(key);
    notifyListeners();
  }

  // Kosongkan keranjang
  void clear() {
    _items.clear();
    notifyListeners();
  }

  // Helper: buat key dari product (pakai id kalau ada, else pakai name)
  String _keyFor(Product p) {
    // jika model Product punya field `id`, gunakan: return p.id;
    // tapi agar kompatibel, gunakan name jika id tidak ada.
    try {
      // coba akses id via reflection-like check (not real reflection).
      // Since Dart doesn't allow dynamic check of field presence easily,
      // we'll fallback to using product name as key.
      return (p as dynamic).id != null ? (p as dynamic).id.toString() : p.name;
    } catch (_) {
      return p.name;
    }
  }
}
