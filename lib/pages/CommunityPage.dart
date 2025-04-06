void sendMessage(String text) {
  if (text.trim().isEmpty) return;

  setState(() {
    messages.add({'sender': 'user', 'text': text});
  });

  _controller.clear();
  _scrollToBottom();

  Future.delayed(const Duration(milliseconds: 500), () {
    String lower = text.toLowerCase();

    if (lower.contains('physiology')) {
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
    } else if ((lower.contains('great gatsby') && lower.contains('review')) ||
        (lower.contains('review') && lower.contains('gatsby')) ||
        (lower.contains('ht egrat gatsby') && lower.contains('review')) ||
        lower.contains('gatsby review')) {
      setState(() {
        messages.add({
          'sender': 'bot',
          'text':
              '📖 *Review of The Great Gatsby*:\n\nF. Scott Fitzgerald’s "The Great Gatsby" is a timeless classic that explores themes of love, wealth, and the American Dream. The prose is elegant, the symbolism is rich, and the characters are unforgettable. Gatsby’s pursuit of Daisy and his tragic downfall make this novel both captivating and heartbreaking.\n\n⭐️⭐️⭐️⭐️⭐️ – A must-read!'
        });
      });
    } else if (lower.contains('great gatsby')) {
      setState(() {
        messages.add({
          'sender': 'bot',
          'text': 'Here is a classic novel you might enjoy:',
          'books': [
            {
              'title': 'The Great Gatsby',
              'author': 'F. Scott Fitzgerald',
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
