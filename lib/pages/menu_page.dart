// lib/pages/menu_page.dart
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  static const routeName = '/menu';
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'name': 'Croissant',
       'price': 'Rp 18.000',
       'img': 'assets/image/croissant.jpeg'
      },
      {'name': 'Roti Tawar', 
      'price': 'Rp 15.000',
      'img' : 'assets/image/bread.jpeg'
      },
      {'name': 'Cupcake', 
      'price': 'Rp 18.000',
      'img': 'assets/image/cupcake.jpeg'
      },
      {'name': 'Donnuts', 
      'price': 'Rp 12.000'
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Menu A"Bakkery'),
      backgroundColor: const Color(0xFFB86945),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final it = items[index];
            return Card(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  croissant ['img']!,
                  width: 90,
                  height: 90,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10),
                Text(
                  item['name']!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(item['price']!,
                    style: const TextStyle(color: Colors.grey)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
