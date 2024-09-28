import 'package:flutter/material.dart';

class CommunityAnnouncementsPage extends StatelessWidget {
  const CommunityAnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> announcements = [
      {'title': 'Community Meeting', 'details': 'Join us for a community meeting next week at the community center.'},
      {'title': 'Park Maintenance', 'details': 'The park will be closed for maintenance this Saturday.'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Announcements'),
      ),
      body: ListView.builder(
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(announcements[index]['title']!),
            subtitle: Text(announcements[index]['details']!),
          );
        },
      ),
    );
  }
}
