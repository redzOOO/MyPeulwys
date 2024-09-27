import 'package:flutter/material.dart';

class ShopInfoPage extends StatelessWidget {
  // Add const to the list and its items
  final List<Map<String, String>> shops = const [
    {'name': 'Peulwys Grocers', 'contact': '01234 567890', 'hours': '9:00 AM - 6:00 PM'},
    {'name': 'Peulwys Cafe', 'contact': '01234 987654', 'hours': '8:00 AM - 5:00 PM'},
  ];

  const ShopInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Information'),
      ),
      body: ListView.builder(
        itemCount: shops.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${shops[index]['name']}'),
            subtitle: Text('Contact: ${shops[index]['contact']}\nHours: ${shops[index]['hours']}'),
          );
        },
      ),
    );
  }
}
