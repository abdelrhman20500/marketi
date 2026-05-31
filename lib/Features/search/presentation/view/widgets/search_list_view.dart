import 'package:flutter/material.dart';
import 'package:marketi/Features/search/data/model/search_model.dart';
import 'package:marketi/Features/search/presentation/view/widgets/product_search.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key, required this.model});

  final List<SearchModel> model;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: model.length,
        itemBuilder: (context, index){
          return ProductSearch(
            name: model[index].title!,
            imageUrl: model[index].thumbnail!,
            quantity: model[index].minimumOrderQuantity!,
            rating: model[index].rating!,
            price: model[index].price!,
          );
        });
  }
}
