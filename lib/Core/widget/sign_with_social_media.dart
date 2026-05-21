import 'package:flutter/material.dart';

class SignWithSocialMedia extends StatelessWidget {
  const SignWithSocialMedia({super.key, required this.icon, required this.color});

  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, size: 30, color: color),
    );
  }
}
