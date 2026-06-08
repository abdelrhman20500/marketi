import 'package:dartz/dartz.dart';
import 'package:marketi/Core/error/failure.dart';
import 'package:marketi/Features/cart/data/model/add_or_remove_cart_model.dart';

import '../../../home/data/model/product_model.dart';

abstract class CartRepo{
  Future<Either<Failure, List<ProductModel>>>getCart();
  Future<Either<Failure, AddOrRemoveCartModel>> addCart({required String id});
  Future<Either<Failure, AddOrRemoveCartModel>> removeCart({required String id});

}