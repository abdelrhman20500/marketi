import 'package:flutter/material.dart';

class BuildHomeSearch extends StatelessWidget {
  const BuildHomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xff3F80FF))
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.black),
            const SizedBox(width: 8),
             Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "What are you looking for ?",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.tune,size: 34, color: Color(0xff3F80FF)),
            ),
          ],
        ),
      );
  }
}
