import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Core/Api/dio_consumer.dart';
import 'package:marketi/Core/utlis/error_dialog.dart';
import 'package:marketi/Features/home/data/data_source/home_data_source.dart';
import 'package:marketi/Features/home/data/repo/home_repo_impl.dart';
import 'package:marketi/Features/home/domain/use_cases/category_use_case.dart';
import 'package:marketi/Features/home/presentation/view/widget/category_grid_view.dart';
import 'package:marketi/Features/home/presentation/view_manager/category_cubit/category_cubit.dart';
import 'package:marketi/Features/home/presentation/view_manager/category_cubit/category_state.dart';

class CategoryBlocBuilder extends StatelessWidget {
  const CategoryBlocBuilder({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(CategoryUseCase(
        HomeRepoImpl(homeRemoteDataSource: HomeRemoteDataSource(apiConsumer:
        DioConsumer(dio:Dio(),),),),),)..categoryDate(),
      child: BlocBuilder<CategoryCubit,CategoryState>(
        builder: (context, state) {
          if(state is CategoryLoading){
            const Center(child: CircularProgressIndicator(),);
          }else if(state is CategoryFailure){
            showErrorDialog(context, state.errMessage);
          }else if(state is CategorySuccess){
            return CategoryGridView(model: state.categoryModel);
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}


