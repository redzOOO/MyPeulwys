import 'package:flutter/material.dart';

class ResidentItemsForSalePage extends StatelessWidget {
  const ResidentItemsForSalePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {'item': 'Sofa for Sale', 'price': '£50', 'description': 'Used sofa in good condition.'},
      {'item': 'Bicycle', 'price': '£100', 'description': 'Mountain bike, barely used.'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Items for Sale'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]['item']!),
            subtitle: Text('Price: ${items[index]['price']}\nDescription: ${items[index]['description']}'),
          );
        },
      ),
    );
  }
}
