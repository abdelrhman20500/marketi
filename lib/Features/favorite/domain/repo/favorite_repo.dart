import 'package:dartz/dartz.dart';
import 'package:marketi/Core/error/failure.dart';
import 'package:marketi/Features/favorite/data/model/add_or_remove_favorite_model.dart';

import '../../../home/data/model/product_model.dart';

abstract class FavoriteRepo{
  Future<Either<Failure, List<ProductModel>>>getFavorite();
  Future<Either<Failure, AddOrRemoveFavoriteModel>>addtoFavorite({required String id});
  Future<Either<Failure, AddOrRemoveFavoriteModel>> removeFavorite({required String productId});
}