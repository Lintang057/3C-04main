// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/home_page.dart';
import 'pages/cover_page.dart';
import 'pages/product_page.dart';
import 'pages/cart_page.dart';
import 'providers/cart_provider.dart';
import 'pages/menu_premium_page.dart';
import 'pages/profile_page.dart';
import 'pages/product_detail_page.dart'as detail;
import 'pages/order_detail_page.dart';
import 'pages/about_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Login Per Halaman',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (_) => const LoginPage(),
        SignUpPage.routeName: (_) => const SignUpPage(),
        HomePage.routeName: (_) => const HomePage(),
        CoverPage.routeName: (_) => const CoverPage(),
        ProductsPage.routeName: (_) => const ProductsPage(),
        CartPage.routeName: (_) => const CartPage(),
        MenuPremiumPage.routeName: (_) => const MenuPremiumPage(),
        '/main': (_) => const MainScreen(),
        ProfilePage.routeName: (_) => const ProfilePage(),
        detail.ProductDetailPage.routeName: (_) => const detail.ProductDetailPage(),
        OrderDetailPage.routeName: (_) => const OrderDetailPage(),
        AboutPage.routeName: (_) => const AboutPage(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
  const MenuPremiumPage(),
  const OrderDetailPage(),
  const AboutPage(),
];

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color(0xFF8B4513), // Warna coklat tua
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.cookie),
            label: 'Produk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Tentang',
          ),
        ],
      ),
    );
  }
}