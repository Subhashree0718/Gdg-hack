import 'package:flutter/material.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Map<String, dynamic>> messages = []; // {'sender': 'user'/'bot', 'text': '...', 'books': [...]}

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      messages.add({'sender': 'user', 'text': text});
    });

    _controller.clear();
    _scrollToBottom();

    // Simulate bot reply
    Future.delayed(const Duration(milliseconds: 500), () {
      if (text.toLowerCase().contains('physiology')) {
        setState(() {
          messages.add({
            'sender': 'bot',
            'text':
                'Sure! Here are some suggested books that are available for donation, based on the topic you asked:',
            'books': [
              {
                'title': 'Human Physiology',
                'author': 'Harper',
                'rating': 4,
              },
              {
                'title': 'Human Physiology Physiotherapy',
                'author': 'Harper',
                'rating': 5,
              }
            ]
          });
        });
      } else {
        setState(() {
          messages.add({
            'sender': 'bot',
            'text': 'I\'m here to help! Please ask about books or topics.',
          });
        });
      }
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text('Bodhi'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: msg['sender'] == 'user'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: msg['sender'] == 'user'
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: msg['sender'] == 'user'
                                ? Colors.grey[300]
                                : Colors.red[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(msg['text']),
                        ),
                        if (msg['books'] != null)
                          Column(
                            children: List.generate(
                              msg['books'].length,
                              (i) {
                                final book = msg['books'][i];
                                return BookSuggestionCard(
                                  title: book['title'],
                                  author: book['author'],
                                  rating: book['rating'],
                                );
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Ask a question',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => sendMessage(_controller.text),
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BookSuggestionCard extends StatelessWidget {
  final String title;
  final String author;
  final int rating;

  const BookSuggestionCard({
    super.key,
    required this.title,
    required this.author,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.red[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 90,
            color: Colors.white,
            child: const Icon(Icons.book, size: 40),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Author: $author'),
                Row(
                  children: List.generate(
                    rating,
                    (index) =>
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Book Appointment'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
