import 'package:flutter/material.dart'; 
import 'package:firebase_core/firebase_core.dart'; // Firebase core package
import 'firebase_options.dart'; // Import the generated Firebase options
import 'pages/estate_info_page.dart';
import 'pages/bin_collection_page.dart';
import 'pages/clo_contacts_page.dart';
import 'pages/school_info_page.dart';
import 'pages/shop_info_page.dart';
import 'pages/resident_interaction_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase with platform-specific options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peulwys Community App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Peulwys Community')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EstateInfoPage()),
                );
              },
              child: const Text('Estate Information'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BinCollectionPage()),
                );
              },
              child: const Text('Bin Collection'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CLOContactsPage()),
                );
              },
              child: const Text('CLO Contacts'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SchoolInfoPage()),
                );
              },
              child: const Text('School Information'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShopInfoPage()),
                );
              },
              child: const Text('Shop Information'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResidentInteractionPage()),
                );
              },
              child: const Text('Resident Interaction'),
            ),
          ],
        ),
      ),
    );
  }
}
