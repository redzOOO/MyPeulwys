import 'package:flutter/material.dart';

class CommunityConversationPage extends StatelessWidget {
  const CommunityConversationPage({super.key}); // Ensure that the class is public (no leading underscore)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Community Conversations')),
      body: ListView.builder(
        itemCount: 5, // Example: Replace with actual conversation count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('User $index'),
            subtitle: Text('This is a message from user $index.'),
          );
        },
      ),
    );
  }
}
