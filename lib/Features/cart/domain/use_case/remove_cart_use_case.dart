import 'package:dartz/dartz.dart';
import 'package:marketi/Core/base_use_case/base_use_case.dart';
import 'package:marketi/Core/error/failure.dart';
import 'package:marketi/Features/cart/data/model/add_or_remove_cart_model.dart';
import 'package:marketi/Features/cart/domain/repo/cart_repo.dart';

class RemoveCartUseCase extends BaseUseCase<AddOrRemoveCartModel, String>{

  final CartRepo cartRepo;

  RemoveCartUseCase(this.cartRepo);
  @override
  Future<Either<Failure, AddOrRemoveCartModel>> call([String? id])async{
    return await cartRepo.removeCart(id: id!);
  }

}