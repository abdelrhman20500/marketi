import 'package:dartz/dartz.dart';
import 'package:marketi/Core/base_use_case/base_use_case.dart';
import 'package:marketi/Core/error/failure.dart';
import 'package:marketi/Features/home/data/model/product_model.dart';
import 'package:marketi/Features/home/domain/repo/home_repo.dart';

class ProductIdUseCase extends BaseUseCase<ProductModel, String> {
  final HomeRepo homeRepo;

  ProductIdUseCase(this.homeRepo);
  @override
  Future<Either<Failure, ProductModel>> call([String? id]) async {
    return await homeRepo.getProductId(id: id!);
  }
}
