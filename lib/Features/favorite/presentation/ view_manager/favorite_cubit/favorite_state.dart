
import '../../../../home/data/model/product_model.dart';
import '../../../data/model/add_or_remove_favorite_model.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final List<ProductModel> productModel;
  FavoriteSuccess({required this.productModel});
}

class FavoriteEmpty extends FavoriteState {}

class FavoriteFailure extends FavoriteState {
  final String errMessage;
  FavoriteFailure({required this.errMessage});
}

class AddFavoriteSuccess extends FavoriteState {
  final AddOrRemoveFavoriteModel addOrRemoveFavoriteModel;
  AddFavoriteSuccess({required this.addOrRemoveFavoriteModel});
}

class AddFavoriteFailure extends FavoriteState {
  final String errMessage;
  AddFavoriteFailure({required this.errMessage});
}

class RemoveFavoriteSuccess extends FavoriteState {
  final AddOrRemoveFavoriteModel addOrRemoveFavoriteModel;
  RemoveFavoriteSuccess({required this.addOrRemoveFavoriteModel});
}

class RemoveFavoriteFailure extends FavoriteState {
  final String errMessage;
  RemoveFavoriteFailure({required this.errMessage});
}

class FavoriteStatusUpdated extends FavoriteState {}