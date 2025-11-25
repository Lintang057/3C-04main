import 'package:flutter/material.dart';
import '../models/product.dart';

class CartItem {
  final Product product;
  int qty;
  CartItem({required this.product, this.qty = 1});
}

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();
  int get totalItems => _items.values.fold(0, (s, i) => s + i.qty);
  double get totalPrice => _items.values.fold(0.0, (s, i) => s + i.qty * i.product.price);

  void add(Product p) {
    if (_items.containsKey(p.id)) {
  _items[p.id]!.qty += 1;
} else {
  _items[p.id] = CartItem(product: p, qty: 1);
}

    notifyListeners();
  }

  void removeSingle(Product p) {
    if (!_items.containsKey(p.id)) return;
    if (_items[p.id]!.qty > 1) _items[p.id]!.qty -= 1;
    else _items.remove(p.id);
    notifyListeners();
  }

  void removeAll(Product p) {
    _items.remove(p.id);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
