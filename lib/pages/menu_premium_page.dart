// lib/pages/menu_premium_page.dart
import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String price;
  final String short;
  final String detail;
  final String image; // path to asset, replace if you have specific images

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.short,
    required this.detail,
    required this.image,
  });
}

class MenuPremiumPage extends StatefulWidget {
  static const routeName = '/menu-premium';
  const MenuPremiumPage({super.key});

  @override
  State<MenuPremiumPage> createState() => _MenuPremiumPageState();
}

class _MenuPremiumPageState extends State<MenuPremiumPage> {
  final List<Product> products = [
    Product(
      id: 'p1',
      name: 'Donat Pingkan Mambo',
      price: 'Rp 9.000',
      short: 'Donat klasik yang lembut & empuk',
      detail:
          'Donat klasik dengan tekstur yang sangat lembut dan rasa manis yang pas. Tersedia varian glaze gula atau kayu manis.',
      image: 'assets/image/donut_pingkan.png',
    ),
    Product(
      id: 'p2',
      name: 'French Toast Delight',
      price: 'Rp 18.000',
      short: 'Roti panggang bertumpuk dengan saus cokelat',
      detail:
          'Roti panggang tebal yang ditumpuk, disiram lelehan saus cokelat/karamel creamy dan taburan gula bubuk. Disajikan hangat.',
      image: 'assets/image/french_toast.png',
    ),
    Product(
      id: 'p3',
      name: 'The Cowboy Cookie',
      price: 'Rp 24.000',
      short: 'Biskuit besar renyah di luar, lembut di dalam',
      detail:
          'Cookie gurih dengan perpaduan mentega, sedikit asin, dan manis. Varian: chocolate chip besar, oatmeal, kacang.',
      image: 'assets/image/cowboy_cookie.png',
    ),
    Product(
      id: 'p4',
      name: 'Cookies Matcha Red Bean',
      price: 'Rp 21.000',
      short: 'Cookies matcha dengan red bean yang lembut',
      detail:
          'Perpaduan matcha terpilih dan isian red bean, pas untuk pecinta rasa Jepang-Indonesia.',
      image: 'assets/image/matcha_cookie.png',
    ),
    Product(
      id: 'p5',
      name: 'Bruno Mars Donuts',
      price: 'Rp 15.000',
      short: 'Varian donat spesial signature',
      detail:
          'Donat signature edisi Bruno Mars: topping spesial dan glaze artisanal (edisi terbatas).',
      image: 'assets/image/bruno_donut.png',
    ),
  ];

  String _search = '';
  String _selectedCategory = 'Semua';

  @override
  Widget build(BuildContext context) {
    final filtered = products.where((p) {
      final q = _search.toLowerCase();
      final inQuery = q.isEmpty ||
          p.name.toLowerCase().contains(q) ||
          p.short.toLowerCase().contains(q) ||
          p.detail.toLowerCase().contains(q);
      final inCategory = _selectedCategory == 'Semua' ? true : true; // placeholder for category logic
      return inQuery && inCategory;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4E2F28),
        elevation: 0,
        title: const Text('Menu — Bakery Premium'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Search',
            onPressed: () => showSearch(context: context, delegate: _ProductSearchDelegate(products)),
            icon: const Icon(Icons.search_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          child: Column(
            children: [
              // top info card
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/image/logo.png',
                          width: 64,
                          height: 64,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 64,
                            height: 64,
                            color: const Color(0xFFEFCCA5),
                            child: const Icon(Icons.bakery_dining, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('A Bakery’s — Cake & Bread', style: TextStyle(fontWeight: FontWeight.w700)),
                            SizedBox(height: 4),
                            Text('Selalu fresh • Menu eksklusif • Pesan antar kilat', style: TextStyle(color: Colors.black54, fontSize: 12)),
                          ],
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Loyalty program (demo)')));
                        },
                        icon: const Icon(Icons.card_giftcard_outlined),
                        label: const Text('Loyalty'),
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFB86946)),
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // category chips (simple)
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 4),
                    _categoryChip('Semua'),
                    const SizedBox(width: 8),
                    _categoryChip('Donuts'),
                    const SizedBox(width: 8),
                    _categoryChip('Toast'),
                    const SizedBox(width: 8),
                    _categoryChip('Cookies'),
                    const SizedBox(width: 8),
                    _categoryChip('Special'),
                    const SizedBox(width: 8),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Grid
              Expanded(
                child: GridView.builder(
                  itemCount: filtered.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (ctx, i) {
                    final p = filtered[i];
                    return GestureDetector(
                      onTap: () => _openDetail(context, p),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, // sesuai permintaan pakai MainAxisAlignment
                          children: [
                            // gambar
                            Image.asset(
                                p.image,
                      
                               
                                fit: BoxFit.cover,
                            
                              ),

                            // teks & tombol
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(p.name, style: const TextStyle(fontWeight: FontWeight.w700)),
                                  const SizedBox(height: 6),
                                  Text(p.short, style: const TextStyle(color: Colors.black54, fontSize: 12), maxLines: 2, overflow: TextOverflow.ellipsis),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(p.price, style: const TextStyle(fontWeight: FontWeight.bold)),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          // demo action: tambah ke cart (replace later with provider)
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${p.name} ditambahkan (demo)')));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFB86946),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: const Text('Beli', style: TextStyle(color: Colors.white)),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
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

  Widget _categoryChip(String label) {
    final bool selected = _selectedCategory == label;
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => setState(() => _selectedCategory = label),
      selectedColor: const Color(0xFFB86946),
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: selected ? Colors.white : Colors.black87),
      elevation: 2,
    );
  }

  void _openDetail(BuildContext context, Product p) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ProductDetailPage(product: p)),
    );
  }
}

/// Product detail page (simple, premium style)
class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF8),
      appBar: AppBar(backgroundColor: const Color(0xFF4E2F28), title: Text(product.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              product.image,
              width: double.infinity,
              height: 260,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 260,
                color: const Color(0xFFEFCCA5),
                child: const Center(child: Icon(Icons.cake, size: 64, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 8),
                  Text(product.price, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF4E2F28))),
                  const SizedBox(height: 12),
                  Text(product.detail, style: const TextStyle(fontSize: 15, height: 1.45)),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ditambahkan ke keranjang (demo)')));
                          },
                          icon: const Icon(Icons.add_shopping_cart),
                          label: const Text('Tambah ke Keranjang'),
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFB86946), padding: const EdgeInsets.symmetric(vertical: 14)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text('Kategori', style: TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Wrap(spacing: 8, children: [Chip(label: Text('Dessert')), Chip(label: Text('Best Seller'))]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Simple search delegate to open product quick
class _ProductSearchDelegate extends SearchDelegate<String> {
  final List<Product> products;
  _ProductSearchDelegate(this.products);

  @override
  List<Widget>? buildActions(BuildContext context) => [IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => close(context, ''));

  @override
  Widget buildResults(BuildContext context) {
    final matches = products.where((p) => p.name.toLowerCase().contains(query.toLowerCase())).toList();
    if (matches.isEmpty) return const Center(child: Text('Tidak ada produk'));
    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (_, i) => ListTile(
        title: Text(matches[i].name),
        subtitle: Text(matches[i].price),
        onTap: () {
          close(context, matches[i].name);
          Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailPage(product: matches[i])));
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final sugg = products.where((p) => p.name.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: sugg.length,
      itemBuilder: (_, i) => ListTile(
        title: Text(sugg[i].name),
        subtitle: Text(sugg[i].short),
        onTap: () {
          query = sugg[i].name;
          showResults(context);
        },
      ),
    );
  }
}
