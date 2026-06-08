import 'package:dartz/dartz.dart';
import 'package:marketi/Core/base_use_case/base_use_case.dart';
import 'package:marketi/Core/error/failure.dart';
import 'package:marketi/Features/cart/domain/repo/cart_repo.dart';
import 'package:marketi/Features/home/data/model/product_model.dart';

class CartUseCase extends BaseUseCase<List<ProductModel>, NoParameters>{
  final CartRepo cartRepo;

  CartUseCase(this.cartRepo);
  @override
  Future<Either<Failure, List<ProductModel>>> call(NoParameters parameters)async{
    return await cartRepo.getCart();
  }
}