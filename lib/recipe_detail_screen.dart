import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipe = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['title']),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(recipe['color'][0]), Color(recipe['color'][1])]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(Icons.timer, 'مدة التحضير', recipe['time']),
            SizedBox(height: 25),
            _buildSectionTitle('المقادير', Icons.shopping_basket),
            SizedBox(height: 10),
            _buildStyledText(recipe['ingredients']),
            SizedBox(height: 25),
            _buildSectionTitle('طريقة التحضير', Icons.format_list_numbered),
            SizedBox(height: 10),
            _buildStyledText(recipe['steps']),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Color(0xFF6B4226), size: 28),
        SizedBox(width: 10),
        Text(title,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6B4226))),
      ],
    );
  }

  Widget _buildStyledText(String text) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.brown.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 3))
        ],
      ),
      child: Text(text,
          style: TextStyle(fontSize: 18, height: 1.5)),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFFF5E6CA), Colors.white]),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xFFD4A056), width: 2)),
      child: Row(
        children: [
          Icon(icon, size: 30, color: Color(0xFF8A9B52)),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      color: Color(0xFF6B4226),
                      fontWeight: FontWeight.bold)),
              Text(value,
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF4A2B0F))),
            ],
          ),
        ],
      ),
    );
  }
}