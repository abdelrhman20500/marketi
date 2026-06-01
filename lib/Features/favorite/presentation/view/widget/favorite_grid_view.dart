import 'package:flutter/material.dart';
import 'package:marketi/Features/favorite/presentation/view/widget/favorite_item.dart';

class FavoriteGridView extends StatelessWidget {
  const FavoriteGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        childAspectRatio: 1.3 / 2.0,
      ),
      itemBuilder: (context, index) {
        return const FavoriteItem();
      },
    );
  }
}
