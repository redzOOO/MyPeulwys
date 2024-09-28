import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; 
import 'pages/estate_info_page.dart';
import 'pages/bin_collection_page.dart';
import 'pages/clo_contacts_page.dart';
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
  } catch (e) {
    debugPrint('Firebase initialization failed: $e');
  }

  runApp(MyApp());
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
          buttonColor: Colors.teal[600], // Teal color for buttons
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: HomePage(), // Removed 'const' from HomePage()
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
            fontSize: 28, // Make the title larger
            fontWeight: FontWeight.bold, // Bold for emphasis
            color: Colors.white, // White text color
          ),
        ),
        centerTitle: true, // Center the title for better visual alignment
        backgroundColor: Colors.teal[800], // Darker teal background for header
        elevation: 10, // Elevation to give depth to the header
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section 1: Announcements (Moved to the top)
              const Text(
                'Announcements',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildButton(context, 'Community Announcements', CommunityAnnouncementsPage()),

              const SizedBox(height: 32),

              // Section 2: Estate and Local Info
              const Text(
                'Estate & Local Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildButton(context, 'Estate Information', EstateInfoPage()), // Removed 'const'
              _buildButton(context, 'Bin Collection', BinCollectionPage()), // Removed 'const'
              _buildButton(context, 'CLO Contacts', CLOContactsPage()), // Removed 'const'
              _buildButton(context, 'School Information', SchoolInfoPage()), // Removed 'const'
              _buildButton(context, 'Shop Information', ShopInfoPage()), // Removed 'const'

              const SizedBox(height: 32),

              // Section 3: Community Interaction
              const Text(
                'Community Interaction',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildButton(context, 'Community Conversations', CommunityConversationPage()), // Removed 'const'
              _buildButton(context, 'Resident Items For Sale', ResidentItemsForSalePage()), // Removed 'const'
            ],
          ),
        ),
      ),
      // Footer section
      bottomNavigationBar: Container(
        color: Colors.teal[100],
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'For the residents, by the residents',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Helper function to build buttons with improved style
  Widget _buildButton(BuildContext context, String title, Widget destinationPage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destinationPage),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.teal[600], // Softer teal for buttons
            shadowColor: Colors.tealAccent, // Shadow for a modern look
            elevation: 6, // Add some elevation for a 3D effect
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white, // Ensure text is white for contrast
            ),
          ),
        ),
      ),
    );
  }
}
