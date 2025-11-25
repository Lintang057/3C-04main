import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Keluar',
          )
        ],
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text('Selamat datang! Anda berhasil masuk (demo).'),
        ),
      ),
    );
  }
}
