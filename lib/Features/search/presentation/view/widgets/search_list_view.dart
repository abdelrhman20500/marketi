import 'package:flutter/material.dart';
import 'package:marketi/Features/search/presentation/view/widgets/product_search.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index){
          return ProductSearch();
        });
  }
}
