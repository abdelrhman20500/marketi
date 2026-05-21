import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, required this.text, this.onPressed,});

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF4A6EFF),
          // foregroundColor: const Color(0xFF6B4EFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
        ),
        onPressed:onPressed,
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold,),),
      ),
    );
  }
}