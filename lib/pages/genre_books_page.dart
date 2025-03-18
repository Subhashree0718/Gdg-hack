import 'package:flutter/material.dart';

class GenreBooksPage extends StatelessWidget {
  final String genre;

  const GenreBooksPage({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$genre Books')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Genre: $genre", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text("Book Name: Example Book", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            const Text("Author: John Doe", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
           Text(
  "Details: This book is an example book with detailed information about $genre genre. It is meant to show how navigation works dynamically.",
  style: const TextStyle(fontSize: 16),
),

          ],
        ),
      ),
    );
  }
}
