import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD4A056), Color(0xFFF5E6CA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/cuis-logo.png', height: 200),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'وصفات خالتي عيشة',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: const Color(0xFF6B4226),
                          fontFamily: 'Cairo',
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'اكتشف أسرار المطبخ التونسي الأصيل',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF4A2B0F),
                        ),
                      ),
                      const SizedBox(height: 25),
                      // Bouton pour la cuisine
                      _buildCategoryButton(
                        context: context,
                        icon: Icons.restaurant_menu,
                        label: 'الأطباق الرئيسية',
                        color: Color(0xFF8A9B52),
                        route: '/cuisine',
                      ),
                      const SizedBox(height: 15),
                      // Bouton pour les pâtisseries
                      _buildCategoryButton(
                        context: context,
                        icon: Icons.bakery_dining,
                        label: 'الحلويات التونسية',
                        color: Color(0xFFD4A056),
                        route: '/pastry',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
    required String route,
  }) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 28),
      label: Text(
        label,
        style: const TextStyle(fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () => Navigator.pushNamed(context, route),
    );
  }
}