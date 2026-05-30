import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Features/home/domain/use_cases/product_use_case.dart';
import 'package:marketi/Features/home/presentation/view_manager/product_cubit/product_state.dart';
import '../../../../../Core/base_use_case/base_use_case.dart';

class ProductCubit extends Cubit<ProductState>{
  ProductCubit(this.productUseCase): super(ProductInitial());

  final ProductUseCase productUseCase;
  Future<void> productData() async {
    emit(ProductLoading());
    var result = await productUseCase.call(const NoParameters());
    result.fold((e) {
      emit(ProductFailure(errMessage: e.message));
    }, (productModel) {
      emit(ProductSuccess(productModel: productModel));
    });
  }
}