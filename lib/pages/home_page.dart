import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peulwys Community'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Peulwys Community!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text('Latest News & Updates', style: TextStyle(fontSize: 18)),
            // Add your content here, such as a list of news articles
          ],
        ),
      ),
    );
  }
}