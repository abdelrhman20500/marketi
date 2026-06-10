import 'package:marketi/Features/cart/data/model/add_or_remove_cart_model.dart';
import '../../../../home/data/model/product_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartFailure extends CartState {
  final String errMessage;
  CartFailure({required this.errMessage});
}

class CartSuccess extends CartState {
  final List<ProductModel> productModel;
  CartSuccess({required this.productModel});
}

class CartEmpty extends CartState {}

class AddCartLoading extends CartState {
  final String productId;
  AddCartLoading({required this.productId});
}

class AddCartFailure extends CartState {
  final String errMessage;
  AddCartFailure({required this.errMessage});
}

class AddCartSuccess extends CartState {
  final AddOrRemoveCartModel addOrRemoveCartModel;
  AddCartSuccess({required this.addOrRemoveCartModel});
}

class RemoveCartLoading extends CartState {}

class RemoveCartSuccess extends CartState {
  final AddOrRemoveCartModel addOrRemoveCartModel;
  RemoveCartSuccess({required this.addOrRemoveCartModel});
}

class RemoveCartFailure extends CartState {
  final String errMessage;
  RemoveCartFailure({required this.errMessage});
}