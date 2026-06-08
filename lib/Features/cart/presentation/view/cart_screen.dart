import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Features/cart/presentation/view/widget/cart_list_view.dart';
import 'package:marketi/Features/cart/presentation/view_manager/cart_cubit/cart_cubit.dart';
import 'package:marketi/Features/cart/presentation/view_manager/cart_cubit/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartFailure) {
          return Center(
            child: Text(state.errMessage,
                style: const TextStyle(color: Colors.red, fontSize: 18)),
          );
        } else if (state is CartEmpty) {
          return const Center(
            child: Text("Cart Is Empty 🛒ً",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.grey)),);
        } else if (state is CartSuccess) {
          final products = state.productModel;
          // ✅ حساب الإجمالي
          final subtotal = products.fold<double>(
            0, (sum, item) => sum + (item.price! * item.minimumOrderQuantity!),);
          return Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: height * 0.02),
                            const Text("Products in Cart", style: TextStyle(color: Colors.blue, fontSize: 22, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    CartListView(model: products),
                  ],
                ),
              ),
              // ✅ Subtotal + Checkout
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal (${products.length} items)",
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        Text("${subtotal.toStringAsFixed(2)} EGP",
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B82F6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text("Checkout",
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
