import 'package:flutter/material.dart';

class MoreGenresPage extends StatelessWidget {
  const MoreGenresPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> genres = [
      {'name': 'Science Fiction', 'icon': Icons.science, 'color': Colors.blue},
      {'name': 'Biography', 'icon': Icons.person, 'color': Colors.teal},
      {'name': 'History', 'icon': Icons.history_edu, 'color': Colors.brown},
      {'name': 'Poetry', 'icon': Icons.menu_book, 'color': Colors.purple},
      {'name': 'Fantasy', 'icon': Icons.auto_stories, 'color': Colors.orange},
      {'name': 'Horror', 'icon': Icons.flash_on, 'color': Colors.red},
      {'name': 'Self Help', 'icon': Icons.psychology, 'color': Colors.green},
      {'name': 'Comics', 'icon': Icons.emoji_emotions, 'color': Colors.amber},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("More Genres"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: genres.length,
          itemBuilder: (context, index) {
            final genre = genres[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: CircleAvatar(
                    backgroundColor: genre['color'].withOpacity(0.2),
                    child: Icon(
                      genre['icon'],
                      color: genre['color'],
                    ),
                  ),
                  title: Text(
                    genre['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // You can implement genre-specific navigation here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Selected ${genre['name']}")),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

