// search_page.dart
import 'package:flutter/material.dart';
import '../widgets/genre_tile.dart';
import '../widgets/book_tile.dart';
import 'genre_books_page.dart'; // import the new page

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  void navigateToGenre(BuildContext context, String genre) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GenreBooksPage(genre: genre),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Title, Author, ISBN',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.pink[50],
              ),
            ),
            const SizedBox(height: 24),
            const Text('EXPLORE GENRES', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                GenreTile(
                  title: "Prep Books",
                  color: Colors.amber,
                  icon: Icons.menu_book,
                  onTap: () => navigateToGenre(context, "Prep Books"),
                ),
                GenreTile(
                  title: "Novel Books",
                  color: Colors.green,
                  icon: Icons.book,
                  onTap: () => navigateToGenre(context, "Novel Books"),
                ),
                GenreTile(
                  title: "Crime Books",
                  color: Colors.purple,
                  icon: Icons.local_police,
                  onTap: () => navigateToGenre(context, "Crime Books"),
                ),
                GenreTile(
                  title: "Mythical",
                  color: Colors.red,
                  icon: Icons.auto_stories,
                  onTap: () => navigateToGenre(context, "Mythical"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/more-genres'),
              child: Row(
                children: const [
                  Text(
                    "Discover more Genres",
                    style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 14, color: Colors.pink),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('YOUR RECOMMENDATIONS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  BookTile(title: 'The Book Thief', imagePath: 'assets/book1.jpg'),
                  BookTile(title: 'Concepts of Physics', imagePath: 'assets/book2.jpg'),
                  BookTile(title: 'To Kill a Mockingbird', imagePath: 'assets/book3.jpg'),
                  BookTile(title: 'New Book', imagePath: 'assets/book1.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
