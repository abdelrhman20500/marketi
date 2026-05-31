import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Core/Api/dio_consumer.dart';
import 'package:marketi/Core/utlis/error_dialog.dart';
import 'package:marketi/Features/home/data/data_source/home_data_source.dart';
import 'package:marketi/Features/home/data/repo/home_repo_impl.dart';
import 'package:marketi/Features/home/domain/use_cases/product_use_case.dart';
import 'package:marketi/Features/home/presentation/view/widget/popular_product_list_view.dart';
import 'package:marketi/Features/home/presentation/view_manager/product_cubit/product_cubit.dart';
import 'package:marketi/Features/home/presentation/view_manager/product_cubit/product_state.dart';

class PopularProductBlocBuilder extends StatelessWidget {
  const PopularProductBlocBuilder({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(ProductUseCase(HomeRepoImpl(homeRemoteDataSource:
      HomeRemoteDataSource(apiConsumer: DioConsumer(dio: Dio())))))..productData(),
      child: BlocBuilder<ProductCubit,ProductState>(
        builder: (context, state) {
          if(state is ProductLoading){
            const Center(child: CircularProgressIndicator(),);
          }else if(state is ProductFailure){
            showErrorDialog(context, state.errMessage);
          }else if(state is ProductSuccess){
            return PopularProductListView(model: state.productModel);
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}


