import 'package:flutter/material.dart';
import 'package:marketi/Features/home/presentation/view/widget/brand_item.dart';

class BrandListView extends StatelessWidget {
  const BrandListView({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return SizedBox(
      height: h * 0.2,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: BrandItem(),
          );
        },
      ),
    );
  }
}