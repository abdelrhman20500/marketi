import 'package:flutter/material.dart';
import 'package:marketi/Features/home/presentation/view/widget/best_for_you_or_buy_again_item.dart';

class BuyAgainListView extends StatelessWidget {
  const BuyAgainListView({super.key});


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
          return const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: BestForYouOrBuyAgainItem(),
          );
        },
      ),
    );
  }
}
