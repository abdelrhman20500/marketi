import 'package:dartz/dartz.dart';
import 'package:marketi/Features/Auth/data/model/register_model.dart';
import '../../../../Core/error/failure.dart';
import '../repo/auth_repo.dart';

class RegisterUseCase {
  final AuthRepo authRepo;
  RegisterUseCase(this.authRepo);
  Future<Either<Failure, RegisterModel>> call(
      {required String name,
      required String phone,
      required String email,
      required String password,
      required String confirmPassword}) async {
    return await authRepo.userRegister(
        name: name,
        phone: phone,
        email: email,
        password: password,
        confirmPassword: confirmPassword);
  }
}
