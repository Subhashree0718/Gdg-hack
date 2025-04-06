import 'package:flutter/material.dart'; 
import 'package:faker/faker.dart' as faker_lib;
import 'package:flutter/services.dart';
import '../pages/Communitypostpage.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CommunityPage(),
  ));
}

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

final faker = faker_lib.Faker();

class _CommunityPageState extends State<CommunityPage> {
  final List<Map<String, String>> _posts = List.generate(
  20,
  (index) => {
    'title': faker.lorem.words(3).join(' '),
    'author': faker.person.name(),
    'description': faker.lorem.sentence(),
    // Replaced with royalty-free image links
    'image': 'https://source.unsplash.com/400x200/?technology,people,city&$index'
// looping through available images
  },
);

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
         leading: IconButton(
  icon: const Icon(Icons.arrow_back, color: Colors.black),
   onPressed: () {
                Navigator.pop(context);
              },
),

          title: const Text('Bodhi',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          actions:  [
            Icon(Icons.person_outline, color: Colors.black),
            SizedBox(width: 10),
            Icon(Icons.notifications_none, color: Colors.black),
            SizedBox(width: 10),
           IconButton(
  icon: Icon(Icons.add_circle_outline, color: Colors.black),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Communitypostpage()),
    );
  },
)

          ],
          elevation: 0,
          bottom: const TabBar(
            indicatorColor: Colors.red,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'Discover'),
              Tab(text: 'Community'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DiscoverTab(
              posts: _posts,
              searchQuery: _searchQuery,
              onSearch: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            CommunityTab(
              posts: _posts,
              searchQuery: _searchQuery,
              onSearch: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DiscoverTab extends StatelessWidget {
  final List<Map<String, String>> posts;
  final String searchQuery;
  final ValueChanged<String> onSearch;

  const DiscoverTab({
    super.key,
    required this.posts,
    required this.searchQuery,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    final filteredPosts = posts
        .where((post) => post['title']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Column(
      children: [
        SearchBarWidget(onSearch: onSearch),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: filteredPosts.length,
            itemBuilder: (context, index) => DiscoverCard(post: filteredPosts[index]),
          ),
        ),
      ],
    );
  }
}

class CommunityTab extends StatelessWidget {
  final List<Map<String, String>> posts;
  final String searchQuery;
  final ValueChanged<String> onSearch;

  const CommunityTab({
    super.key,
    required this.posts,
    required this.searchQuery,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    final filteredPosts = posts
        .where((post) => post['title']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Column(
      children: [
        SearchBarWidget(onSearch: onSearch),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: filteredPosts.length,
            itemBuilder: (context, index) => CommunityCard(post: filteredPosts[index]),
          ),
        ),
      ],
    );
  }
}

class DiscoverCard extends StatelessWidget {
  final Map<String, String> post;

  const DiscoverCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userInfoRow(post['author']!),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Image.network(post['image']!, height: 150, fit: BoxFit.cover),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Image.network(post['image']!, height: 150, fit: BoxFit.cover),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(post['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(post['description']!),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.favorite_border, size: 16),
                    SizedBox(width: 8),
                    Icon(Icons.comment_outlined, size: 16),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {},
                  child: const Text("Book Appointment", style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CommunityCard extends StatelessWidget {
  final Map<String, String> post;

  const CommunityCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userInfoRow(post['author']!),
            const SizedBox(height: 8),
            Image.network(post['image']!, height: 180, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 8),
            Text(post['description']!),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.favorite_border, size: 16),
                SizedBox(width: 8),
                Icon(Icons.comment_outlined, size: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  final ValueChanged<String> onSearch;

  const SearchBarWidget({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: onSearch,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.pink[50],
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

Widget userInfoRow(String author) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage('https://picsum.photos/random/50x50?person'),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(author, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Text('Novel Hobbyist', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
      const Text("Oct 28 2025", style: TextStyle(fontSize: 12)),
    ],
  );
}
