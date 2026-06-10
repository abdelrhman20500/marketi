
import 'package:flutter/material.dart';
import 'package:marketi/Features/cart/presentation/view/widget/product_cart.dart';
import 'package:marketi/Features/home/data/model/product_model.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key, required this.model,});

  final List<ProductModel> model;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
              padding: const EdgeInsets.all(6.0),
              child: ProductCard(
                imageUrl: model[index].thumbnail!,
                title: model[index].title!,
                rating: model[index].rating!,
                price: model[index].price!,
                quantity: model[index].minimumOrderQuantity!,
                productId: model[index].id!,
              )
          );
        },
        childCount: model.length,
      ),
    );
  }
}
