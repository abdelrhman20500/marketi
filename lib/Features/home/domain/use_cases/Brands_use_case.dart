import 'package:dartz/dartz.dart';
import 'package:marketi/Core/base_use_case/base_use_case.dart';
import 'package:marketi/Core/error/failure.dart';
import 'package:marketi/Features/home/data/model/brands_model.dart';
import 'package:marketi/Features/home/domain/repo/home_repo.dart';

class BrandsUseCase extends BaseUseCase<List<BrandsModel>, NoParameters> {
  final HomeRepo homeRepo;

  BrandsUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BrandsModel>>> call(NoParameters parameters) async {
    return await homeRepo.getBrands();
  }
}
