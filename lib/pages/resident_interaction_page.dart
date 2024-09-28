import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ResidentInteractionPage extends StatelessWidget {
  final TextEditingController messageController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ResidentInteractionPage({super.key});

  // Fetch posts from Firestore
  Stream<QuerySnapshot> getPosts() {
    return firestore.collection('posts').orderBy('timestamp', descending: true).snapshots();
  }

  // Add a new post to Firestore
  void addPost(String firstName, String lastName, String message) {
    firestore.collection('posts').add({
      'firstName': firstName,
      'lastName': lastName,
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resident Interaction'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: getPosts(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final posts = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    final firstName = post['firstName'];
                    final lastName = post['lastName'][0]; // Show only first letter
                    final message = post['message'];
                    return ListTile(
                      title: Text('$firstName $lastName.'),
                      subtitle: Text(message),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      labelText: 'Your message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Add a new post with sample firstName and lastName
                    addPost('John', 'Doe', messageController.text);
                    messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
