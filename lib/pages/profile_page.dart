import 'package:flutter/material.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // FOTO PROFIL
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.brown.shade200,
                  backgroundImage: const AssetImage(
                    'assets/image/profile.jpg', // ganti sesuai asset kamu
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Bakery Premium',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'user@example.com',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // MENU PROFIL
          _profileItem(
            icon: Icons.person_outline,
            title: 'Edit Profil',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Edit profil (demo)')),
              );
            },
          ),
          _profileItem(
            icon: Icons.location_on_outlined,
            title: 'Alamat Pengiriman',
            onTap: () {},
          ),
          _profileItem(
            icon: Icons.receipt_long_outlined,
            title: 'Riwayat Pesanan',
            onTap: () {},
          ),
          _profileItem(
            icon: Icons.help_outline,
            title: 'Bantuan',
            onTap: () {},
          ),

          const SizedBox(height: 20),

          // LOGOUT
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.logout),
            label: const Text(
              'Logout',
              style: TextStyle(fontSize: 16),
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginPage.routeName,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  // WIDGET ITEM PROFIL
  Widget _profileItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.brown),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
