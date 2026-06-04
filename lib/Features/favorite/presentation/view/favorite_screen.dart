import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Features/favorite/presentation/%20view_manager/favorite_cubit/favorite_cubit.dart';
import 'package:marketi/Features/favorite/presentation/%20view_manager/favorite_cubit/favorite_state.dart';
import 'package:marketi/Features/favorite/presentation/view/widget/favorite_grid_view.dart';
import '../../../home/data/model/product_model.dart';
import '../../../home/presentation/view/widget/build_home_search.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final favoriteCubit = FavoriteCubit.get(context);
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        if (state is RemoveFavoriteSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('🗑️ Removed from favorites'),
              backgroundColor: Colors.orange,
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return const Center(child: CircularProgressIndicator(),);
        }
        List<ProductModel> products = [];
        if (state is FavoriteSuccess) {
          products = state.productModel;
        } else if (state is! FavoriteLoading) {
          // Use current products from cubit
          products = favoriteCubit.currentProducts;
        }
        // ✅ Show products (no more loading!)
        if (products.isEmpty) {
          return const Center(child: Text("No favorites yet",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),);
        }
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
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              sliver: FavoriteGridView(model: products),
            ),
          ],
        );
      },
    );
  }
}