import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Core/Api/dio_consumer.dart';
import 'package:marketi/Features/home/data/data_source/home_data_source.dart';
import 'package:marketi/Features/home/data/repo/home_repo_impl.dart';
import 'package:marketi/Features/home/domain/use_cases/product_id_use_case.dart';
import 'package:marketi/Features/home/presentation/view/widget/product_details/product_details_item.dart';
import 'package:marketi/Features/home/presentation/view_manager/productId_cubit/product_id_cubit.dart';

import '../../../../../layout/presentation/view/layout_screen.dart';
import '../../../view_manager/productId_cubit/product_id_state.dart';


class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String routeName = "ProductDetailsScreen";

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LayoutScreen(),
              ),
                  (route) => false,
            );
          },
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
        ),
        title: const Text(
          "Product Details",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.blue, size: 30),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => ProductIdCubit(ProductIdUseCase(HomeRepoImpl(homeRemoteDataSource:
        HomeRemoteDataSource(apiConsumer: DioConsumer(dio: Dio())))
        ))..productIdDate(id: productId),
        child: BlocBuilder<ProductIdCubit, ProductIdState>(
          builder: (context, state) {
            if (state is ProductIdLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductIdFailure) {
              return const Center(child: Text("No product details available"));
            } else if (state is ProductIdSuccess) {
              return ProductDetailsItem(model: state.productModel);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}