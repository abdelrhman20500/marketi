import 'package:dartz/dartz.dart';
import 'package:marketi/Features/Auth/data/model/reset_password_code_model.dart';
import '../../../../Core/error/failure.dart';
import '../repo/auth_repo.dart';

class ResetPasswordCodeUseCase {
  final AuthRepo authRepo;
  ResetPasswordCodeUseCase(this.authRepo);
  Future<Either<Failure, ResetPasswordCodeModel>> call({required String email}) async {
    return await authRepo.resetPasswordCode(email: email);
  }
}
