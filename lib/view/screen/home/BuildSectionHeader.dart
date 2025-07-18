
import 'package:flutter/material.dart';

class BuildSectionHeader extends StatelessWidget {
  const BuildSectionHeader({super.key, required this.title, this.onAdd});

  final String title;
  final VoidCallback? onAdd;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (onAdd != null)
          IconButton(
            icon: const Icon(Icons.add_circle_outline, size: 28),
            onPressed: onAdd,
          ),
      ],
    );
  }
}