import 'package:flutter/material.dart';

class TunisianCuisineScreen extends StatelessWidget {
  final List<Map<String, dynamic>> recipes = [
    {
      'title': 'الكسكسي التونسية',
      'photo': 'assets/couscous.jpg',
      'ingredients': '''- 500غ لحم بقري
- 2 بصل
- 2 فص ثوم
- 1 ملعقة هريسة
- 1 ملعقة ربّاط''',
      'steps': '''1. تقلى البصل والثوم
2. تضاف اللحمة وتقلب
3. تضاف التوابل وتترك على نار هادئة''',
      'color': [0xFFD4A056, 0xFFF5E6CA],
      'time': '1h 30min',
      'difficulty': 'متوسطة'
    },
    {
      'title': 'الشوربة',
      'photo': 'assets/soup.jpg',
      'ingredients': '''- 200غ عدس
- 1 جزر
- 1 بطاطا
- كمون
- ماء زهر''',
      'steps': '''1. ينقع العدس
2. يطهى مع الخضار
3. يخلط ويتبل''',
      'color': [0xFF8A9B52, 0xFFC8D5B9],
      'time': '45min',
      'difficulty': 'سهلة'
    },
    {
      'title': 'البريك',
      'photo': 'assets/brik.jpg',
      'ingredients': '''- ورق بريك
- 4 بيضات
- تونة
- هريسة
- قزبر''',
      'steps': '''1. تحضير الحشوة
2. طي الورق
3. قلي في الزيت''',
      'color': [0xFFA0522D, 0xFFDEB887],
      'time': '30min',
      'difficulty': 'سهلة'
    },
    {
      'title': 'العجة التونسية',
      'photo': 'assets/ojja.jpg',
      'ingredients': '''- 4 بيضات
- مَرْقَة طماطم
- فلفل حار
- هريسة
- كبابة''',
      'steps': '''1. تحضير الصلصة
2. إضافة البهارات
3. خفق البيض''',
      'color': [0xFFD2691E, 0xFFFFD700],
      'time': '25min',
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
    Color(recipes[index]['color'][0]),
    Color(recipes[index]['color'][1])
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    ),
    ),
    child: ListTile(
    leading: ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Image.asset(
    recipes[index]['photo'],
    width: 60,
    height: 60,
    fit: BoxFit.cover,
    ),
    ),
    title: Text(
    recipes[index]['title'],
    style: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white),
    ),
    subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'الوقت: ${recipes[index]['time']}',
    style: const TextStyle(color: Colors.white70),
    ),
    Text(
    'الصعوبة: ${recipes[index]['difficulty']}',
    style: TextStyle(
    color: recipes[index]['difficulty'] == 'سهلة'
    ? Colors.green[100]
        : Colors.amber[100]),
    ),
    ],
    ),
    trailing: const Icon(Icons.chevron_right, color: Colors.white),
    onTap: () => Navigator.pushNamed(
    context,
    '/detail',
    arguments: recipes[index]),
    ),
    ),
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar('الأطباق الرئيسية'),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 15),
        itemCount: recipes.length,
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemBuilder: _buildRecipeCard,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(String title) {
    return AppBar(
      title: Text(title),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFFD4A056), Color(0xFF8A9B52)]),
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
    );
  }
}