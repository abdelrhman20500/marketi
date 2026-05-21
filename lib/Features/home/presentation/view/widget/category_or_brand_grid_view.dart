import 'package:flutter/material.dart';
import 'category_or_brand_item.dart';

class CategoryOrBrandGridView extends StatelessWidget {
  const CategoryOrBrandGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 12.0,
        childAspectRatio: 1.4 / 1.5,
      ),
      itemBuilder: (context, index) {
        return const CategoryOrBrandItem();
      },
    );
  }
}