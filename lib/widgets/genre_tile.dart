import 'package:flutter/material.dart';

class GenreTile extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;

  const GenreTile({super.key, required this.title, required this.color, required this.icon, required void Function() onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
