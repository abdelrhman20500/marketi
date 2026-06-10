import 'package:flutter/material.dart';
import 'package:marketi/Features/favorite/presentation/view/widget/favorite_item.dart';
import 'package:marketi/Features/home/data/model/product_model.dart';

class FavoriteGridView extends StatelessWidget {
  const FavoriteGridView({super.key, required this.model});
  final List<ProductModel> model;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: model.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        childAspectRatio: 1.3 / 2.0,
      ),
      itemBuilder: (context, index) {
        return FavoriteItem(
          id: model[index].id.toString(),
          title: model[index].title!,
          imageUrl: model[index].thumbnail!,
          price: model[index].price!,
          rating: model[index].rating!,
        );
      },
    );
  }
}
