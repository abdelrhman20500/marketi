import 'package:dartz/dartz.dart';
import 'package:marketi/Core/error/failure.dart';
import 'package:marketi/Features/menu/data/model/user_model.dart';

abstract class UserRepo{
  Future<Either<Failure, UserModel>> userData();
}