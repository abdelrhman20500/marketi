import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Features/favorite/domain/use_case/add_to_favorite_use_case.dart';
import 'package:marketi/Features/favorite/domain/use_case/favorite_use_case.dart';
import 'package:marketi/Features/favorite/domain/use_case/remove_favorite_use_case.dart';
import '../../../../../Core/base_use_case/base_use_case.dart';
import '../../../../home/data/model/product_model.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.addToFavoriteUseCase, this.removeFavoriteUseCase,this.favoriteUseCase,) : super(FavoriteInitial());

  final FavoriteUseCase favoriteUseCase;
  final AddToFavoriteUseCase addToFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;

  static FavoriteCubit get(BuildContext context) => BlocProvider.of(context);

  Set<String> favoriteProductIds = {};
  List<ProductModel> currentProducts = [];

  Future<void> getFavorite({bool showLoading = true}) async {
    if (showLoading) {
      emit(FavoriteLoading());
    }
    var result = await favoriteUseCase.call(const NoParameters());
    result.fold((e) {
        emit(FavoriteFailure(errMessage: e.message));
      }, (productModels) {
        currentProducts = productModels;
        favoriteProductIds = productModels.map((p) => p.id.toString()).toSet();
        if (currentProducts.isEmpty) {
          emit(FavoriteEmpty());
        } else {
          emit(FavoriteSuccess(productModel: currentProducts));
        }
      },
    );
  }

  Future<void> toggleFavorite({required String productId}) async {
    final isFavorite = favoriteProductIds.contains(productId);
    if (isFavorite) {
      await removeFromFavorite(productId: productId);
    } else {
      await addToFavorite(productId: productId);
    }
  }

  Future<void> removeFromFavorite({required String productId}) async {
    final previousProducts = List<ProductModel>.from(currentProducts);
    currentProducts = currentProducts
        .where((p) => p.id.toString() != productId).toList();
    favoriteProductIds.remove(productId);
    if (currentProducts.isEmpty) {
      emit(FavoriteEmpty());
    } else {
      emit(FavoriteSuccess(productModel: currentProducts));
    }
    final result = await removeFavoriteUseCase.call(productId);
    result.fold((e) {
        currentProducts = previousProducts;
        favoriteProductIds = previousProducts.map((p) => p.id.toString()).toSet();
        emit(FavoriteSuccess(productModel: currentProducts));
        emit(RemoveFavoriteFailure(errMessage: e.message));
      }, (model) {
        emit(RemoveFavoriteSuccess(addOrRemoveFavoriteModel: model));
      },
    );
  }
  Future<void> addToFavorite({required String productId}) async {
    favoriteProductIds.add(productId);
    emit(FavoriteStatusUpdated());
    final result = await addToFavoriteUseCase.call(productId);
    result.fold((e) {
        favoriteProductIds.remove(productId);
        emit(AddFavoriteFailure(errMessage: e.message));
        getFavorite(showLoading: false);
      },(model) async {
        emit(AddFavoriteSuccess(addOrRemoveFavoriteModel: model));
        await getFavorite(showLoading: false);
      },
    );
  }
}