import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BinCollectionPage extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Remove const from here
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
              
              return ListTile(
                title: Text('$day - $type'),
              );
            },
          );
        },
      ),
    );
  }
}
