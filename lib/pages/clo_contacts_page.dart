import 'package:flutter/material.dart';

class CLOContactsPage extends StatelessWidget {
  const CLOContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Liaison Officer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'CLO Contact Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Officer: Cartrefi Conwy\nEmail: enquiries@cartreficonwy.org\nPhone: 0300 124 0040',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Message function or email link
              },
              child: const Text('Send Message to CLO'),
            ),
          ],
        ),
      ),
    );
  }
}
