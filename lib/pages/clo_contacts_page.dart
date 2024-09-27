import 'package:flutter/material.dart';

class CLOContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Liaison Officer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CLO Contact Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Officer: Jane Doe\nEmail: jane.doe@peulwys.com\nPhone: 01234 567890',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Message function or email link
              },
              child: Text('Send Message to CLO'),
            ),
          ],
        ),
      ),
    );
  }
}
