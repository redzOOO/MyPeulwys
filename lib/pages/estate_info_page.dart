import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Correct import for URL launching

class EstateInfoPage extends StatelessWidget {
  const EstateInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peulwys Estate Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Peulwys Community Centre',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Address: Peulwys Community Centre, Swn Y Don, Peulwys Estate, Llysfaen, Conwy LL29 9LL',
            ),
            const SizedBox(height: 16),
            Image.network(
              'https://cartreficonwy.org/wp-content/uploads/2016/03/p1949469_913700644_3.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Text(
              'History & Overview',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Peulwys Estate is located in Llysfaen, North Wales, and consists of approximately 250 homes. Originally a small rural community, the estate has developed into a well-planned residential area. Managed by Cartrefi Conwy, recent improvements have introduced biodiversity projects, tree planting, and seasonal blooms.',
            ),
            const SizedBox(height: 16),
            const Text(
              'Parks & Recreation',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'The estate features two parks and a skate park for residents to enjoy:',
            ),
            const SizedBox(height: 8),
            const Text(
              '- Peulwys Main Park: A popular spot with playground equipment and seating areas.',
            ),
            const Text(
              '- Peulwys Lower Park: A quieter green space for picnics and relaxation.',
            ),
            const Text(
              '- Peulwys Skate Park: A modern skate park near the main park with ramps and rails for skaters and BMX riders.',
            ),
            const SizedBox(height: 16),
            const Text(
              'Find on the map:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _launchURL(Uri.parse('https://www.google.com/maps/dir/?api=1&destination=Peulwys+Community+Centre')),
              child: const Text(
                'Peulwys Community Centre',
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _launchURL(Uri.parse('https://www.google.com/maps/dir/?api=1&destination=Peulwys+Park')),
              child: const Text(
                'Peulwys Main Park',
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _launchURL(Uri.parse('https://www.google.com/maps/dir/?api=1&destination=Peulwys+Skate+Park')),
              child: const Text(
                'Peulwys Skate Park',
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Updated URL launcher method
  void _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
