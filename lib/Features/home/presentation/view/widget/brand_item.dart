import 'package:flutter/material.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({super.key, required this.emoji, });

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Emoji Display
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF3B82F6).withOpacity(0.1),
                  const Color(0xFF8B5CF6).withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: Text(
                emoji,
                style: const TextStyle(
                  fontSize: 48,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}