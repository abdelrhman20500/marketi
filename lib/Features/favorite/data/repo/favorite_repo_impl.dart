import 'package:dartz/dartz.dart';
import 'package:marketi/Core/error/failure.dart';
import 'package:marketi/Features/favorite/data/data_source/favorite_remote_data_source.dart';
import 'package:marketi/Features/favorite/data/model/add_or_remove_favorite_model.dart';
import 'package:marketi/Features/favorite/domain/repo/favorite_repo.dart';
import 'package:marketi/Features/home/data/model/product_model.dart';

import '../../../../Core/error/exceptions.dart';

class FavoriteRepoImpl extends FavoriteRepo{
  final FavoriteBaseRemoteDataSource favoriteBaseRemoteDataSource;

  FavoriteRepoImpl({required this.favoriteBaseRemoteDataSource});
  @override
  Future<Either<Failure, AddOrRemoveFavoriteModel>> addtoFavorite({required String id})async{
    try {
      final result= await favoriteBaseRemoteDataSource.addFavorite(id: id);
      return right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.errModel.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getFavorite()async{
    try {
      final result= await favoriteBaseRemoteDataSource.favorite();
      return right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.errModel.message!),
      );
    }
  }

  @override
  Future<Either<Failure, AddOrRemoveFavoriteModel>> removeFavorite({required String productId})async{
    try {
      final result= await favoriteBaseRemoteDataSource.removeFavorite(id: productId);
      return right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.errModel.message!),
      );
    }
  }

}