import 'package:flutter/material.dart';
import '../widgets/book_tile.dart';
import '../pages/profile_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "User"; // Default Name

  void fetchUsername() async {
    // Example Firebase Code:
    // String fetchedName = await FirebaseService.getUserName();
    // setState(() {
    //   username = fetchedName;
    // });
  }

  @override
  void initState() {
    super.initState();
    fetchUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: const Color(0xFFDB4437),
  elevation: 0,
  toolbarHeight: 160,
  automaticallyImplyLeading: false, // REMOVE default black icon
  title: Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white, size: 30),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome 👋',
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
            const SizedBox(height: 6),
            Text(
              username,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 30,
                shadows: [
                  Shadow(
                    offset: Offset(0.5, 0.5),
                    color: Colors.black54,
                    blurRadius: 0.5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  ),
),


      // Drawer Implementation
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFDB4437),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    username,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const Text(
                    'Book Lover 📚',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Search'),
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_circle_outline),
              title: const Text('Add'),
              onTap: () {
                Navigator.pushNamed(context, '/donation');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              'What would you like to do today, $username?',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Row Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/donation');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Colors.black),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.volunteer_activism, color: Colors.black),
                          SizedBox(height: 6),
                          Text('Donate', style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/chatbot');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDB4437),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.chat_bubble_outline, color: Colors.white),
                          SizedBox(height: 6),
                          Text('Chat', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
  child: Container(
    margin: const EdgeInsets.all(8),
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/signin'); // Updated route to SigninPage
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.black),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.group, color: Colors.black),
          SizedBox(height: 6),
          Text('Join Us', style: TextStyle(color: Colors.black)),
        ],
      ),
    ),
  ),
),

              ],
            ),

            // Recommendation Section
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                '📚 Your Recommendations',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 23,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  BookTile(title: 'The Book Thief', imagePath: 'assets/book1.jpg'),
                  BookTile(title: 'The Great Gatsby', imagePath: 'assets/book2.jpg'),
                  BookTile(title: 'Devil Wears Prada', imagePath: 'assets/book3.jpg'),
                  BookTile(title: 'To Kill a Mockingbird', imagePath: 'assets/book1.jpg'),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Ace Ranker Section
            const Text('🏆 Ace Ranker',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 23)),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  BookTile(title: '47 Years IIT-JEE', imagePath: 'assets/book2.jpg'),
                  BookTile(title: 'Physics Encyclopedia', imagePath: 'assets/book3.jpg'),
                  BookTile(title: 'Concepts of Physics', imagePath: 'assets/book1.jpg'),
                  BookTile(title: 'Civil Services', imagePath: 'assets/book2.jpg'),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Popular Reads Section
            const Text('🔥 Popular Reads',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 23)),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  BookTile(title: 'The Alchemist', imagePath: 'assets/book1.jpg'),
                  BookTile(title: 'Wings of Fire', imagePath: 'assets/book2.jpg'),
                  BookTile(title: 'Atomic Habits', imagePath: 'assets/book3.jpg'),
                  BookTile(title: 'Rich Dad Poor Dad', imagePath: 'assets/book1.jpg'),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),

      // Bottom Nav Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/search');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/donation');
          } else if (index == 3) {
            // Settings (Optional)
          } else if (index == 4) {
            Navigator.pushNamed(context, '/profile');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
        ],
      ),
    );
  }
}
