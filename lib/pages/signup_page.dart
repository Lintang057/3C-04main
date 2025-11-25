// lib/pages/signup_page.dart
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = '/signup';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();
  final TextEditingController _rePassCtrl = TextEditingController();
  bool _obscure = true;
  bool _loading = false;

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _rePassCtrl.dispose();
    super.dispose();
  }

  Future<void> _onSignUp() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _loading = true);

    // Simulasi request jaringan singkat (ganti dengan API/Firebase)
    await Future.delayed(const Duration(milliseconds: 900));

    setState(() => _loading = false);
    if (!mounted) return;

    // Demo: langsung kembali ke login setelah registrasi berhasil
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Akun berhasil dibuat (demo). Silakan login.')),
    );
    Navigator.pop(context); // kembali ke halaman login
  }

  String? _validateUsername(String? v) {
    if (v == null || v.trim().isEmpty) return 'Username tidak boleh kosong';
    if (v.trim().length < 3) return 'Minimal 3 karakter';
    return null;
  }

  String? _validateEmail(String? v) {
    if (v == null || v.trim().isEmpty) return 'Email tidak boleh kosong';
    final email = v.trim();
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(email)) return 'Masukkan email valid';
    return null;
  }

  String? _validatePassword(String? v) {
    if (v == null || v.isEmpty) return 'Password tidak boleh kosong';
    if (v.length < 6) return 'Password minimal 6 karakter';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(12.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color(0xFF4E2F28),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: radius),
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Optional logo
                        // Image.asset('assets/image/logo.png', width: 84, height: 84),
                        // const SizedBox(height: 12),

                        const Text(
                          'Buat Akun Baru',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF4E2F28),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Username
                        TextFormField(
                          controller: _usernameCtrl,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            prefixIcon: Icon(Icons.person_outline),
                            border: OutlineInputBorder(),
                          ),
                          validator: _validateUsername,
                        ),
                        const SizedBox(height: 12),

                        // Email
                        TextFormField(
                          controller: _emailCtrl,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(),
                          ),
                          validator: _validateEmail,
                        ),
                        const SizedBox(height: 12),

                        // Password
                        TextFormField(
                          controller: _passCtrl,
                          obscureText: _obscure,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline),
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                              onPressed: () => setState(() => _obscure = !_obscure),
                            ),
                          ),
                          validator: _validatePassword,
                        ),
                        const SizedBox(height: 12),

                        // Re-type password
                        TextFormField(
                          controller: _rePassCtrl,
                          obscureText: _obscure,
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            labelText: 'Konfirmasi Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(),
                          ),
                          validator: (v) {
                            final err = _validatePassword(v);
                            if (err != null) return err;
                            if (v != _passCtrl.text) return 'Password tidak cocok';
                            return null;
                          },
                        ),
                        const SizedBox(height: 18),

                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: _loading ? null : _onSignUp,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB86946),
                              shape: RoundedRectangleBorder(borderRadius: radius),
                            ),
                            child: _loading
                                ? const CircularProgressIndicator.adaptive()
                                : const Text('Create account', style: TextStyle(fontSize: 16)),
                          ),
                        ),

                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Sudah punya akun?'),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Log in'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
