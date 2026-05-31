import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Features/home/domain/use_cases/category_use_case.dart';
import 'package:marketi/Features/home/presentation/view_manager/category_cubit/category_state.dart';

import '../../../../../Core/base_use_case/base_use_case.dart';

class CategoryCubit extends Cubit<CategoryState>{
  CategoryCubit(this.categoryUseCase): super(CategoryInitial());

  final CategoryUseCase categoryUseCase;
  Future<void> categoryDate() async {
    emit(CategoryLoading());
    var result = await categoryUseCase.call(const NoParameters());
    result.fold((e) {
      emit(CategoryFailure(errMessage: e.message));
    }, (categoryModel) {
      emit(CategorySuccess(categoryModel: categoryModel));
    });
  }
}