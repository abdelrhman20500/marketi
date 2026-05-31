import 'package:dartz/dartz.dart';
import 'package:marketi/Core/base_use_case/base_use_case.dart';
import 'package:marketi/Core/error/failure.dart';
import 'package:marketi/Features/home/data/model/product_model.dart';
import 'package:marketi/Features/home/domain/repo/home_repo.dart';

class ProductUseCase extends BaseUseCase<List<ProductModel>, NoParameters> {
  final HomeRepo homeRepo;

  ProductUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<ProductModel>>> call(NoParameters parameters) async {
    return await homeRepo.getProduct();
  }
}
