import 'package:dartz/dartz.dart';
import 'package:marketi/Core/base_use_case/base_use_case.dart';
import 'package:marketi/Core/error/failure.dart';
import 'package:marketi/Features/favorite/data/model/add_or_remove_favorite_model.dart';
import 'package:marketi/Features/favorite/domain/repo/favorite_repo.dart';

class AddToFavoriteUseCase extends BaseUseCase<AddOrRemoveFavoriteModel, String>{
  final FavoriteRepo favoriteRepo;

  AddToFavoriteUseCase(this.favoriteRepo);
  @override
  Future<Either<Failure, AddOrRemoveFavoriteModel>> call([String? id])async{
   return await favoriteRepo.addtoFavorite(id: id!);
  }

}