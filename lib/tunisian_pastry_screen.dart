import 'package:flutter/material.dart';

class TunisianPastryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> pastries = [
    {
      'title': 'المقروض',
      'photo': 'assets/makroudh.jpg',
      'ingredients': '''- 500غ سميد
- 1 كوب زيت زيتون
- 1 كوب عسل
- قرفة''',
      'steps': '''1. عجن السميد بالزيت
2. تشكيل العجين
3. خبز في الفرن
4. سكب العسل''',
      'color': [0xFFA0522D, 0xFFDEB887],
      'time': '2h',
      'difficulty': 'متوسطة'
    },
    {
      'title': 'الزلابية',
      'photo': 'assets/zlabia.jpg',
      'ingredients': '''- 2 كوب دقيق
- 1 ملعقة خميرة
- ماء زهر
- زيت للقلي''',
      'steps': '''1. تحضير العجين
2. تشكيل الزلابية
3. قلي في الزيت
4. تغطية بالعسل''',
      'color': [0xFFD2691E, 0xFFFFD700],
      'time': '1h',
      'difficulty': 'سهلة'
    },
    {
      'title': 'البقلاوة',
      'photo': 'assets/baklawa.jpg',
      'ingredients': '''- 250غ جوز
- 1 رزمة ورق جلاش
- 1 كوب سكر
- قطر''',
      'steps': '''1. تحضير الحشوة
2. تركيب الطبقات
3. خبز وتغطية بالقطر''',
      'color': [0xFF6B4226, 0xFFA8784A],
      'time': '2h30',
      'difficulty': 'صعبة'
    },
    {
      'title': 'الفطير',
      'photo': 'assets/ftayer.jpg',
      'ingredients': '''- 500غ دقيق
- 200غ تمر
- سمسم
- ماء الورد''',
      'steps': '''1. تحضير العجين
2. حشو التمر
3. تشكيل وخبز''',
      'color': [0xFF8B4513, 0xFFCD853F],
      'time': '1h45',
      'difficulty': 'متوسطة'
    },
    {
      'title': 'الكعك',
      'photo': 'assets/kaak.jpg',
      'ingredients': '''- 400غ دقيق
- 150غ سكر
- 1 ملعقة بيكنغ باودر
- ماء الزهر''',
      'steps': '''1. عجن المكونات
2. تشكيل الكعك
3. خبز حتى الذهبية''',
      'color': [0xFFDAA520, 0xFFFFD700],
      'time': '1h15',
      'difficulty': 'سهلة'
    },
  ];

  Widget _buildRecipeCard(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
      BoxShadow(
      color: Colors.brown.withOpacity(0.2),
      blurRadius: 10,
      offset: const Offset(0, 5)
      ),
      ],
    ),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [
    Color(pastries[index]['color'][0]),
    Color(pastries[index]['color'][1])
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    ),
    ),
    child: ListTile(
    leading: ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Image.asset(
    pastries[index]['photo'],
    width: 60,
    height: 60,
    fit: BoxFit.cover,
    ),
    ),
    title: Text(
    pastries[index]['title'],
    style: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white),
    ),
    subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'الوقت: ${pastries[index]['time']}',
    style: const TextStyle(color: Colors.white70),
    ),
    Text(
    'الصعوبة: ${pastries[index]['difficulty']}',
    style: TextStyle(
    color: _getDifficultyColor(pastries[index]['difficulty']),
    ),
    ),
    ],
    ),
    trailing: const Icon(Icons.chevron_right, color: Colors.white),
    onTap: () => Navigator.pushNamed(
    context,
    '/detail',
    arguments: pastries[index]),
    ),
    ),
    ),
    );
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty) {
      case 'سهلة':
        return Colors.green[100]!;
      case 'متوسطة':
        return Colors.amber[100]!;
      case 'صعبة':
        return Colors.red[100]!;
      default:
        return Colors.white70;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar('الحلويات التونسية'),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemCount: pastries.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: _buildRecipeCard,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(String title) {
    return AppBar(
      title: Text(title),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD4A056), Color(0xFF8A9B52)],
          ),
        ),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
    );
  }
}