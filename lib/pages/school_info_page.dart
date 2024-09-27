import 'package:flutter/material.dart';

class SchoolInfoPage extends StatelessWidget {
  // Add const to the list and its items
  final List<Map<String, String>> schools = const [
    {'name': 'Peulwys Primary School', 'contact': '01234 567890', 'term': '01/09 - 15/12'},
    {'name': 'Peulwys High School', 'contact': '01234 987654', 'term': '01/09 - 20/12'},
  ];

  const SchoolInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Information'),
      ),
      body: ListView.builder(
        itemCount: schools.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${schools[index]['name']}'),
            subtitle: Text('Contact: ${schools[index]['contact']}\nTerm Dates: ${schools[index]['term']}'),
          );
        },
      ),
    );
  }
}
