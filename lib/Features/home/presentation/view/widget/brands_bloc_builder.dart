import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Core/Api/dio_consumer.dart';
import 'package:marketi/Core/utlis/error_dialog.dart';
import 'package:marketi/Features/home/data/data_source/home_data_source.dart';
import 'package:marketi/Features/home/data/repo/home_repo_impl.dart';
import 'package:marketi/Features/home/domain/use_cases/Brands_use_case.dart';
import 'package:marketi/Features/home/presentation/view/widget/brand_list_view.dart';
import 'package:marketi/Features/home/presentation/view_manager/brands_cubit/brands_cubit.dart';
import 'package:marketi/Features/home/presentation/view_manager/brands_cubit/brands_state.dart';

class BrandsBlocBuilder extends StatelessWidget {
  const BrandsBlocBuilder({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrandsCubit(BrandsUseCase(HomeRepoImpl(homeRemoteDataSource:
      HomeRemoteDataSource(apiConsumer: DioConsumer(dio: Dio())))))..brandDate(),
      child: BlocBuilder<BrandsCubit,BrandsState>(
        builder: (context, state) {
          if(state is BrandsLoading){
            const Center(child: CircularProgressIndicator(),);
          }else if(state is BrandsFailure){
            showErrorDialog(context, state.errMessage);
          }else if(state is BrandsSuccess){
            return BrandListView(model: state.brandsModel);
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}


