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
      },
    );
  }
}
