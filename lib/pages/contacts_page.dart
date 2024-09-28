import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        backgroundColor: Colors.teal[800], // Update header style
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // CLO Section
            _buildSectionTitle('Community Liaison Officer'),
            _buildContactCard(
              title: 'Officer: Cartrefi Conwy',
              email: 'enquiries@cartreficonwy.org',
              phone: '0300 124 0040',
              icon: Icons.account_circle,
            ),
            const SizedBox(height: 20),

            // Llysfaen Community Council Section
            _buildSectionTitle('Llysfaen Community Council'),
            _buildContactCard(
              title: 'Llysfaen Community Council',
              email: 'clerk@llysfaencc.org.uk',
              phone: '01492 513569',
              icon: Icons.gavel,
            ),
            const SizedBox(height: 20),

            // General Message Button
            ElevatedButton(
              onPressed: () {
                // Add your message or email link here
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor: Colors.teal[600], // Styling for button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Send a Message to CLO',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            const SizedBox(height: 40), // Added spacing for future use

            // Hidden Committees Section
            Visibility(
              visible: false, // Hide this section for now
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildSectionTitle('Community Committees'),
                  _buildContactCard(
                    title: 'Neighborhood Watch',
                    email: 'watch@community.org',
                    phone: '0300 123 4567',
                    icon: Icons.group,
                  ),
                  _buildContactCard(
                    title: 'Youth Group Committee',
                    email: 'youth@community.org',
                    phone: '0300 123 9876',
                    icon: Icons.child_care,
                  ),
                  _buildContactCard(
                    title: 'Events Committee',
                    email: 'events@community.org',
                    phone: '0300 123 6543',
                    icon: Icons.event,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Footer
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.teal[100],
        child: const Text(
          'For the residents, by the residents',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
      ),
    );
  }

  // Function to build section title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
    );
  }

  // Function to build contact card with name, email, phone, and icon
  Widget _buildContactCard({required String title, required String email, required String phone, required IconData icon}) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.teal[700]),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Email: $email\nPhone: $phone'),
        trailing: Icon(Icons.email, color: Colors.teal[700]),
      ),
    );
  }
}
