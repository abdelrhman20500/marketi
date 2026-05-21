import 'package:dartz/dartz.dart';
import 'package:marketi/Features/Auth/data/model/login_model.dart';
import '../../../../Core/error/failure.dart';
import '../repo/auth_repo.dart';

class LoginUseCase{
  final AuthRepo authRepo;
  LoginUseCase(this.authRepo);
  Future<Either<Failure,LoginModel>> call({required String email,required String password}) async {
    return await authRepo.userLogin(email: email, password: password);
  }
}