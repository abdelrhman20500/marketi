import 'package:dartz/dartz.dart';
import 'package:marketi/Core/base_use_case/base_use_case.dart';
import 'package:marketi/Core/error/failure.dart';
import 'package:marketi/Features/favorite/domain/repo/favorite_repo.dart';
import 'package:marketi/Features/home/data/model/product_model.dart';

class FavoriteUseCase extends BaseUseCase<List<ProductModel>, NoParameters> {
  final FavoriteRepo favoriteRepo;

  FavoriteUseCase(this.favoriteRepo);
  @override
  Future<Either<Failure, List<ProductModel>>> call(NoParameters parameters) async {
    return await favoriteRepo.getFavorite();
  }
}
