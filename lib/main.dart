import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; // Firebase Messaging
import 'firebase_options.dart';
import 'pages/estate_info_page.dart';
import 'pages/bin_collection_page.dart';
import 'pages/contacts_page.dart';
import 'pages/school_info_page.dart';
import 'pages/shop_info_page.dart';
import 'pages/community_conversation_page.dart';
import 'pages/resident_items_for_sale_page.dart';
import 'pages/community_announcements_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    setupFirebaseMessaging(); // Initialize Firebase Messaging
  } catch (e) {
    debugPrint('Firebase initialization failed: $e');
  }

  runApp(MyApp());
}

void setupFirebaseMessaging() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Request permission for notifications
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    debugPrint('User granted permission');
  }

  // Handle foreground messages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint('Received a message: ${message.notification?.title}');
  });

  // Optionally, get the device token for FCM
  String? token = await messaging.getToken();
  debugPrint('FCM Token: $token');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peulwys Community App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.light,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.teal[600],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Peulwys Community',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Pacifico',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[800],
        elevation: 10,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.teal[100]!, Colors.teal[200]!],
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Announcements', Icons.announcement),
              const SizedBox(height: 16),
              _buildCard(context, 'Community Announcements', CommunityAnnouncementsPage()),

              const SizedBox(height: 32),

              _buildSectionTitle('Estate & Local Information', Icons.info),
              const SizedBox(height: 16),
              _buildCard(context, 'Estate Information', EstateInfoPage()),
              _buildCard(context, 'Bin Collection', BinCollectionPage()),
              _buildCard(context, 'Contacts', ContactsPage()),
              _buildCard(context, 'School Information', SchoolInfoPage()),
              _buildCard(context, 'Shop Information', ShopInfoPage()),

              const SizedBox(height: 32),

              _buildSectionTitle('Community Interaction', Icons.group),
              const SizedBox(height: 16),
              _buildCard(context, 'Community Conversations', CommunityConversationPage()),
              _buildCard(context, 'Resident Items For Sale', ResidentItemsForSalePage()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.teal[100],
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'For the residents, by the residents',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
            fontFamily: 'Pacifico',
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 28, color: Colors.teal[900]),
        const SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.teal[900],
          ),
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, String title, Widget destinationPage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 8,
        shadowColor: Colors.tealAccent,
        child: ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.teal),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destinationPage),
            );
          },
        ),
      ),
    );
  }
}
