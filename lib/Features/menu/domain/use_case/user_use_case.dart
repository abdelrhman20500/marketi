import 'package:dartz/dartz.dart';
import 'package:marketi/Core/base_use_case/base_use_case.dart';
import 'package:marketi/Core/error/failure.dart';
import 'package:marketi/Features/menu/data/model/user_model.dart';
import 'package:marketi/Features/menu/domain/repo/user_repo.dart';

class UserUseCase extends BaseUseCase<UserModel, NoParameters>{

  final UserRepo userRepo;
  UserUseCase(this.userRepo);
  @override
  Future<Either<Failure, UserModel>> call(NoParameters parameters)async{
    return await userRepo.userData();
  }
}