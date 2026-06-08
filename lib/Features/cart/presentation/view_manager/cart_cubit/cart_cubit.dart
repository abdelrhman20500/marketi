import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Core/base_use_case/base_use_case.dart';
import 'package:marketi/Features/cart/domain/use_case/add_cart_use_case.dart';
import 'package:marketi/Features/cart/domain/use_case/cart_use_case.dart';
import 'package:marketi/Features/cart/domain/use_case/remove_cart_use_case.dart';
import '../../../../home/data/model/product_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(
      this.addCartUseCase,
      this.removeCartUseCase,
      this.cartUseCase,
      ) : super(CartInitial());

  final CartUseCase cartUseCase;
  final AddCartUseCase addCartUseCase;
  final RemoveCartUseCase removeCartUseCase;

  static CartCubit get(context) => BlocProvider.of(context);

  /// Get cart products
  Future<void> getCart() async {
    // emit(CartLoading());
    var result = await cartUseCase.call(const NoParameters());
    result.fold((e) {
        emit(CartFailure(errMessage: e.message));
      }, (productModel) {
        if (productModel.isEmpty) {
          emit(CartEmpty());
        } else {
          emit(CartSuccess(productModel: productModel));
        }
      },
    );
  }

  /// Add product to cart
  Future<void> addCart({required String productId}) async {
    // ✅ إرسال الـ Loading مع productId
    emit(AddCartLoading(productId: productId));

    var result = await addCartUseCase.call(productId);

    result.fold(
          (e) {
        emit(AddCartFailure(errMessage: e.message));
      },
          (addOrRemoveCartModel) {
        emit(AddCartSuccess(addOrRemoveCartModel: addOrRemoveCartModel));
        getCart(); // تحديث السلة بعد الإضافة
      },
    );
  }

  /// Remove product from cart
  Future<void> removeCart({required String productId}) async {
    emit(RemoveCartLoading());

    var result = await removeCartUseCase.call(productId);

    result.fold(
          (e) {
        emit(RemoveCartFailure(errMessage: e.message));
      },
          (addOrRemoveCartModel) {
        emit(RemoveCartSuccess(addOrRemoveCartModel: addOrRemoveCartModel));
        getCart();
      },
    );
  }

  /// Increase quantity
  void increaseQuantity(int productId) {
    if (state is CartSuccess) {
      final products = List<ProductModel>.from((state as CartSuccess).productModel);
      final index = products.indexWhere((p) => p.id == productId);
      if (index != -1) {
        products[index].minimumOrderQuantity = products[index].minimumOrderQuantity! + 1;
        emit(CartSuccess(productModel: products));
      }
    }
  }

  /// Decrease quantity
  void decreaseQuantity(int productId) {
    if (state is CartSuccess) {
      final products = List<ProductModel>.from((state as CartSuccess).productModel);
      final index = products.indexWhere((p) => p.id == productId);
      if (index != -1 && products[index].minimumOrderQuantity! > 1) {
        products[index].minimumOrderQuantity = products[index].minimumOrderQuantity! - 1;
        emit(CartSuccess(productModel: products));
      }
    }
  }

}