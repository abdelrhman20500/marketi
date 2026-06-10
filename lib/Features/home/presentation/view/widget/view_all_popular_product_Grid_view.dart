import 'package:flutter/material.dart';
import 'package:marketi/Features/home/presentation/view/widget/product_item_for_list.dart';

class ViewAllGridView extends StatelessWidget {
  const ViewAllGridView({super.key});

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
        return const ProductItemForList();
      },
    );
  }
}