// lib/pages/login_page.dart
import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'menu_premium_page.dart';
import '../widgets/social_buttons.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscure = true;
  bool _loading = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _onLogin() async {
  if (!(_formKey.currentState?.validate() ?? false)) return;
  setState(() => _loading = true);
  await Future.delayed(const Duration(milliseconds: 600));
  setState(() => _loading = false);

  // **Navigasi langsung** — gunakan route name yang terdaftar
  if (!mounted) return;
  try {
    Navigator.pushReplacementNamed(context, MenuPremiumPage.routeName);
  } catch (e) {
    // fallback: langsung push widget supaya kita tahu apakah routeName bermasalah
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MenuPremiumPage()),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(12.0);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset('assets/image/logo.png', width: 120, height: 120, errorBuilder: (_, __, ___) => const FlutterLogo(size: 120)),
                    const SizedBox(height: 20),
                    const Text('Log in',
                        style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF4E2F28))), // dark brown
                    const SizedBox(height: 20),

                    // Card
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: radius),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          children: [
                            // Email
                            TextFormField(
                              controller: _emailCtrl,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email_outlined),
                                hintText: 'Email',
                                border: OutlineInputBorder(),
                              ),
                              validator: (v) {
                                if (v == null || v.isEmpty) return 'Email tidak boleh kosong';
                                if (!v.contains('@')) return 'Masukkan email yang valid';
                                return null;
                              },
                            ),
                            const SizedBox(height: 12),

                            // Password
                            TextFormField(
                              controller: _passCtrl,
                              obscureText: _obscure,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock_outline),
                                hintText: 'Password',
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                                  onPressed: () => setState(() => _obscure = !_obscure),
                                ),
                              ),
                              validator: (v) {
                                if (v == null || v.isEmpty) return 'Password tidak boleh kosong';
                                if (v.length < 6) return 'Password minimal 6 karakter';
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),

                            // Forgot right-aligned
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Fitur lupa password belum tersedia')),
                                    );
                                  },
                                  child: const Text('Forgot password?'),
                                )
                              ],
                            ),

                            const SizedBox(height: 6),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: _loading ? null : _onLogin,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 184, 105, 84),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                                child: _loading
                                    ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                                      )
                                    : const Text('Login', style: TextStyle(fontSize: 16)),
                              ),
                            ),

                            const SizedBox(height: 12),
                            const Text('-- Sign in with --'),

                            const SizedBox(height: 12),
                            SocialButtons(onGoogleTap: _onGoogleTap, onAppleTap: _onAppleTap),

                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have account? "),
                                GestureDetector(
                                  onTap: () => Navigator.pushNamed(context, SignUpPage.routeName),
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Color(0xFFB86946),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onGoogleTap() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Google sign-in (demo)')));
  }

  void _onAppleTap() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Apple sign-in (demo)')));
  }
}
