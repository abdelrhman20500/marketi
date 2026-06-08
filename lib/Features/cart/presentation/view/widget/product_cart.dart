import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Features/cart/presentation/view_manager/cart_cubit/cart_cubit.dart';
import 'package:marketi/Features/cart/presentation/view_manager/cart_cubit/cart_state.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.imageUrl, required this.title,
    required this.price, required this.rating, required this.productId, required this.quantity,});

  final String imageUrl;
  final String title;
  final double price;
  final double rating;
  final int productId;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.2,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width*0.3,
            height: height * 0.18,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                height: height * 0.15,
                width: width*0.3,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: height * 0.15,
                    width: 100,
                    color: Colors.grey[300],
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(width: width*0.02),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                        maxLines: 1, overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    BlocConsumer<CartCubit, CartState>(
                      listener: (context, state) {
                        if (state is RemoveCartSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.addOrRemoveCartModel.message!),
                              backgroundColor: Colors.green,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        } else if (state is RemoveCartFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errMessage),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        final isLoading = state is RemoveCartLoading;
                        return IconButton(
                          onPressed: isLoading
                              ? null
                              : () {
                            context.read<CartCubit>().removeCart(
                                productId: productId.toString());
                          },
                          icon: isLoading
                              ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.red,
                            ),
                          )
                              : const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                            size: 28,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: height*0.001),
                Text("${price.toStringAsFixed(2)} EGP",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF3B82F6),),),
                SizedBox(height: height*0.01),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 26),
                        const SizedBox(width: 4),
                        Text("(${rating.toString()})", style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4A6EFF),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.remove, color: Colors.white, size: 18),
                            onPressed: () {
                              context.read<CartCubit>().decreaseQuantity(productId);
                            },
                            constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text('$quantity',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4A6EFF),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add, color: Colors.white, size: 18),
                            onPressed: () {
                              context.read<CartCubit>().increaseQuantity(productId);
                            },
                            constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}