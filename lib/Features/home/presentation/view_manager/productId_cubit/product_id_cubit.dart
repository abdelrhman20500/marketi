import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Features/home/domain/use_cases/product_id_use_case.dart';
import 'package:marketi/Features/home/presentation/view_manager/productId_cubit/product_id_state.dart';


class ProductIdCubit extends Cubit<ProductIdState>{
  ProductIdCubit(this.productIdUseCase): super(ProductIdInitial());
  final ProductIdUseCase productIdUseCase;
  Future<void> productIdDate({required String id}) async {
    emit(ProductIdLoading());
    var result = await productIdUseCase.call(id);
    result.fold((e) {
      emit(ProductIdFailure(errMessage: e.message));
    }, (productModel) {
      emit(ProductIdSuccess(productModel: productModel));
    });
  }
}