import 'package:dartz/dartz.dart';
import 'package:marketi/Core/error/failure.dart';
import 'package:marketi/Features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:marketi/Features/cart/data/model/add_or_remove_cart_model.dart';
import 'package:marketi/Features/cart/domain/repo/cart_repo.dart';
import 'package:marketi/Features/home/data/model/product_model.dart';
import '../../../../Core/error/exceptions.dart';

class CartRepoImpl extends CartRepo{

  final CartBaseRemoteDataSource cartBaseRemoteDataSource;

  CartRepoImpl({required this.cartBaseRemoteDataSource});
  @override
  Future<Either<Failure, AddOrRemoveCartModel>> addCart({required String id})async{
    try {
      final result= await cartBaseRemoteDataSource.addCart(id: id);
      return right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message!),);
    }
  }

  @override
  Future<Either<Failure, AddOrRemoveCartModel>> removeCart({required String id})async{
    try {
      final result= await cartBaseRemoteDataSource.removeCart(id: id);
      return right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message!),);
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getCart()async{
    try {
      final result= await cartBaseRemoteDataSource.getCart();
      return right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message!),);
    }
  }
}