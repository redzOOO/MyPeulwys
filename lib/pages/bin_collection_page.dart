import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class BinCollectionPage extends StatelessWidget {
  BinCollectionPage({super.key}); // Removed 'const' from here

  // Sample bin collection schedule data (non-constant)
  final List<Map<String, String>> sampleSchedules = [
    {'day': 'Monday', 'type': 'Recycling Waste (Green Bins)', 'date': '2024-09-30'},
    {'day': 'Wednesday', 'type': 'Food Waste (Small Bin)', 'date': '2024-10-02'},
    {'day': 'Friday', 'type': 'Textiles & Electrical Items', 'date': '2024-10-04'},
    {'day': 'Saturday', 'type': 'General Waste (Black Bin)', 'date': '2024-10-05'},
  ];

  @override
  Widget build(BuildContext context) {
    // Get today's date
    final DateTime today = DateTime.now();
    final String todayString = DateFormat('EEEE, MMMM d, yyyy').format(today);

    // Find the next collection based on today's date
    final Map<String, String>? nextCollection = _findNextCollection(sampleSchedules, today);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bin Collection Schedule'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () async {
              if (context.mounted) {
                await _exportToICS(context); // Guarding against async context use
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today's Date: $todayString",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (nextCollection != null)
              Text(
                "Next Collection: ${nextCollection['day']} - ${nextCollection['date']}",
                style: const TextStyle(fontSize: 18, color: Colors.teal),
              ),
            const SizedBox(height: 8),
            if (nextCollection != null)
              Text(
                "Collection Type: ${nextCollection['type']}",
                style: const TextStyle(fontSize: 16),
              ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: sampleSchedules.length,
                itemBuilder: (context, index) {
                  final schedule = sampleSchedules[index];
                  final day = schedule['day'] ?? 'Unknown';
                  final type = schedule['type'] ?? 'Unknown';

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
                      icon = Icons.help_outline;
                  }

                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: ListTile(
                      leading: Icon(icon, size: 40, color: Colors.teal),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to find the next collection date
  Map<String, String>? _findNextCollection(List<Map<String, String>> schedules, DateTime today) {
    for (var schedule in schedules) {
      DateTime collectionDate = DateTime.parse(schedule['date']!);
      if (collectionDate.isAfter(today)) {
        return schedule;
      }
    }
    return null; // No future collection found
  }

  // Helper function to create and export an ICS file
  Future<void> _exportToICS(BuildContext context) async {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      try {
        // Get external storage directory
        final directory = await getExternalStorageDirectory();
        final String path = '${directory!.path}/bin_schedule.ics';

        // Create ICS file content
        StringBuffer icsContent = StringBuffer();
        icsContent.write("BEGIN:VCALENDAR\nVERSION:2.0\nPRODID:-//Peulwys Community//NONSGML v1.0//EN\n");
        for (var schedule in sampleSchedules) {
          String startDate = DateFormat('yyyyMMdd').format(DateTime.parse(schedule['date']!));
          icsContent.write("BEGIN:VEVENT\n");
          icsContent.write("SUMMARY:${schedule['type']}\n");
          icsContent.write("DTSTART:$startDate\n");
          icsContent.write("END:VEVENT\n");
        }
        icsContent.write("END:VCALENDAR");

        // Write the ICS file
        final file = File(path);
        await file.writeAsString(icsContent.toString());

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('ICS file saved to: $path')),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to create ICS file: $e')),
          );
        }
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Permission to write to storage denied')),
        );
      }
    }
  }
}
