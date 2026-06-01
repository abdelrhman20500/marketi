import 'package:flutter/material.dart';
import 'package:marketi/Features/favorite/presentation/view/widget/favorite_grid_view.dart';

import '../../../home/presentation/view/widget/build_home_search.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: height * 0.01),
                const BuildHomeSearch(),
                SizedBox(height: height * 0.02),
                const Text("All Product",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          sliver: FavoriteGridView(),
        ),
      ],
    );
  }
}
