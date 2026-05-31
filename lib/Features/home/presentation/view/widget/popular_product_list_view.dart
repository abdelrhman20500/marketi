import 'package:flutter/material.dart';
import 'package:marketi/Features/home/data/model/product_model.dart';
import 'popular_product_item.dart';

class PopularProductListView extends StatelessWidget {
  const PopularProductListView({super.key, required this.model});

  final List<ProductModel> model;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return SizedBox(
      height: h * 0.37,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: PopularProductItem(
              title: model[index].title!,
              imageUrl: model[index].thumbnail!,
              price: model[index].price!,
              rating: model[index].rating!,
            ),
          );
        },
      ),
    );
  }
}