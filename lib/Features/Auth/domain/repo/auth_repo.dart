import 'package:dartz/dartz.dart';
import 'package:marketi/Features/Auth/data/model/login_model.dart';
import 'package:marketi/Features/Auth/data/model/reset_password_code_model.dart';
import '../../../../Core/error/failure.dart';
import '../../data/model/register_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> userLogin(
      {required String email, required String password});
  Future<Either<Failure, RegisterModel>> userRegister(
      {required String name,
      required String phone,
      required String email,
      required String password,
      required String confirmPassword});
  Future<Either<Failure, ResetPasswordCodeModel>> resetPasswordCode({required String email});
}
