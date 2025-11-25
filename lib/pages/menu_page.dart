// lib/pages/menu_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import 'product_detail.dart';

class MenuPage extends StatefulWidget {
  static const routeName = '/menu';
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final TextEditingController _searchCtrl = TextEditingController();
  String _selectedCategory = 'Semua';
  final List<String> _categories = ['Semua', 'Roti', 'Kue', 'Pastry', 'Minuman'];

  // Demo product list (ganti dengan data nyata dari backend atau PDF yang di-ekstrak)
  List<Product> get _allProducts => [
        Product(id: 'p1', name: 'Croissant', description: 'Renyah & buttery', price: 12000, image: 'assets/image/croissant.png'),
        Product(id: 'p2', name: 'Roti Tawar', description: 'Lembut untuk sarapan', price: 15000, image: 'assets/image/bread.png'),
        Product(id: 'p3', name: 'Cupcake Cokelat', description: 'Manis & moist', price: 18000, image: 'assets/image/cupcake.png'),
        Product(id: 'p4', name: 'Pain au chocolat', description: 'Cokelat lembut', price: 14000, image: 'assets/image/pain.png'),
        Product(id: 'p5', name: 'Kopi Tubruk', description: 'Panas / dingin', price: 8000, image: 'assets/image/coffee.png'),
      ];

  List<Product> get _filtered {
    final q = _searchCtrl.text.trim().toLowerCase();
    return _allProducts.where((p) {
      final matchesCategory = _selectedCategory == 'Semua' ||
          (_selectedCategory == 'Roti' && p.name.toLowerCase().contains('roti')) ||
          (_selectedCategory == 'Kue' && p.name.toLowerCase().contains('cupcake')) == false; // fallback, mostly ignore
      final matchesQuery = q.isEmpty || p.name.toLowerCase().contains(q) || p.description.toLowerCase().contains(q);
      // Note: category matching above is simple; replace with product.category if available
      return matchesQuery && (_selectedCategory == 'Semua' ? true : true && matchesQuery && true && matchesCategory);
    }).toList();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = _filtered;
    final isWide = MediaQuery.of(context).size.width > 720;
    final crossAxis = isWide ? 3 : 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, _) => Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                    onPressed: () => Navigator.pushNamed(context, '/cart'),
                    icon: const Icon(Icons.shopping_cart_outlined)),
                if (cart.totalItems > 0)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                      constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                      child: Text('${cart.totalItems}', style: const TextStyle(color: Colors.white, fontSize: 12), textAlign: TextAlign.center),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: Column(
            children: [
              // Search & category row
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchCtrl,
                      onChanged: (_) => setState(() {}),
                      decoration: InputDecoration(
                        hintText: 'Cari roti, kue, pastry...',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                        contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  PopupMenuButton<String>(
                    tooltip: 'Kategori',
                    icon: const Icon(Icons.filter_list),
                    onSelected: (v) => setState(() => _selectedCategory = v),
                    itemBuilder: (_) => _categories.map((c) => PopupMenuItem(value: c, child: Text(c))).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Category chips
              SizedBox(
                height: 38,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (ctx, i) {
                    final c = _categories[i];
                    final selected = c == _selectedCategory;
                    return ChoiceChip(
                      label: Text(c),
                      selected: selected,
                      onSelected: (_) => setState(() => _selectedCategory = c),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),

              // Grid
              Expanded(
                child: products.isEmpty
                    ? const Center(child: Text('Tidak ada produk'))
                    : GridView.builder(
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxis,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.78,
                        ),
                        itemBuilder: (ctx, idx) {
                          final p = products[idx];
                          return Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            elevation: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetail(product: p))),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                      child: Image.asset(p.image, fit: BoxFit.cover, errorBuilder: (c,e,s) => Container(color: Colors.grey.shade200, child: const Icon(Icons.bakery_dining, size: 48))),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(p.name, style: const TextStyle(fontWeight: FontWeight.w700)),
                                      const SizedBox(height: 4),
                                      Text(p.description, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.black54, fontSize: 12)),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          Text('Rp ${p.price.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w700)),
                                          const Spacer(),
                                          IconButton(
                                            onPressed: () {
                                              Provider.of<CartProvider>(context, listen: false).add(p);
                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ditambahkan ke keranjang')));
                                            },
                                            icon: const Icon(Icons.add_shopping_cart_outlined),
                                            tooltip: 'Tambah',
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
