import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Features/home/domain/use_cases/Brands_use_case.dart';
import 'package:marketi/Features/home/presentation/view_manager/brands_cubit/brands_state.dart';
import '../../../../../Core/base_use_case/base_use_case.dart';

class BrandsCubit extends Cubit<BrandsState>{
  BrandsCubit(this.brandsUseCase): super(BrandsInitial());

  final BrandsUseCase brandsUseCase;
  Future<void> brandDate() async {
    emit(BrandsLoading());
    var result = await brandsUseCase.call(const NoParameters());
    result.fold((e) {
      emit(BrandsFailure(errMessage: e.message));
    }, (brandsModel) {
      emit(BrandsSuccess(brandsModel: brandsModel));
    });
  }
}