import 'package:dartz/dartz.dart';
import 'package:marketi/Core/base_use_case/base_use_case.dart';
import 'package:marketi/Core/error/failure.dart';
import 'package:marketi/Features/home/data/model/category_model.dart';
import 'package:marketi/Features/home/domain/repo/home_repo.dart';

class CategoryUseCase extends BaseUseCase<List<CategoryModel>, NoParameters> {
  final HomeRepo homeRepo;

  CategoryUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<CategoryModel>>> call(NoParameters parameters) async {
    return await homeRepo.getCategory();
  }
}
