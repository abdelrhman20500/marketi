import 'package:dartz/dartz.dart';
import 'package:marketi/Features/Auth/data/model/register_model.dart';
import 'package:marketi/Features/Auth/data/model/reset_password_code_model.dart';

import '../../../../Core/Api/api_consumer.dart';
import '../../../../Core/Api/end_point.dart';
import '../../../../Core/cached/shared_pref.dart';
import '../../../../Core/error/exceptions.dart';
import '../../../../Core/error/failure.dart';
import '../../domain/repo/auth_repo.dart';
import '../model/login_model.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiConsumer apiConsumer;

  AuthRepoImpl({required this.apiConsumer});
  @override
  Future<Either<Failure, LoginModel>> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      var response = await apiConsumer.post(EndPoint.signIn,
        data: {
          "email": email,
          "password": password,
        },);
      final loginModel = LoginModel.fromJson(response);
      SharedPref.saveToken(loginModel.token!);
      return Right(loginModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message ?? 'Unknown error'));
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> userRegister({
    required String name, required String phone, required String email,
    required String password, required String confirmPassword})async{
    try {
      var response = await apiConsumer.post(EndPoint.signUp,
        data:{
          "name":name,
          "phone":phone,
          "email":email,
          "password":password,
          "confirmPassword":confirmPassword
        },);
      final registerModel = RegisterModel.fromJson(response);
      print(registerModel.message);
      return Right(registerModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message ?? 'Unknown error'));
    }
  }

  @override
  Future<Either<Failure, ResetPasswordCodeModel>> resetPasswordCode({
    required String email})async{
    try {
      var response = await apiConsumer.post(EndPoint.resetPasswordCode,
        data:{
          "email":email,
        });
      final resetPasswordCodeModel = ResetPasswordCodeModel.fromJson(response);
      print(resetPasswordCodeModel.message);
      return Right(resetPasswordCodeModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message ?? 'Unknown error'));
    }
  }
}
