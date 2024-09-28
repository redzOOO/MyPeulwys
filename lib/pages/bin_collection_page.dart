import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BinCollectionPage extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  BinCollectionPage({super.key});

  // Fetch bin collection data from Firestore
  Stream<QuerySnapshot> getBinSchedules() {
    return firestore.collection('bin_schedules').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bin Collection Schedule'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getBinSchedules(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final schedules = snapshot.data!.docs;
          return ListView.builder(
            itemCount: schedules.length,
            itemBuilder: (context, index) {
              final schedule = schedules[index];
              final day = schedule['day'] ?? 'Unknown';  // Handle missing data
              final type = schedule['type'] ?? 'Unknown'; // Handle missing data
              
              // Determine the icon based on the type of waste
              IconData icon;
              switch (type) {
                case 'Recycling Waste (Green Bins)':
                  icon = Icons.recycling;
                  break;
                case 'Food Waste (Small Bin)':
                  icon = Icons.fastfood;
                  break;
                case 'Textiles & Electrical Items':
                  icon = Icons.electrical_services;
                  break;
                case 'General Waste (Black Bin)':
                  icon = Icons.delete;
                  break;
                default:
                  icon = Icons.help_outline; // Fallback icon
              }

              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: ListTile(
                  leading: Icon(icon, size: 40, color: Colors.teal), // Icon for the waste type
                  title: Text(
                    day,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    type,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
