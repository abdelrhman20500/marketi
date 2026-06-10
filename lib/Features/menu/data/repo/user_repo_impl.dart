import 'package:dartz/dartz.dart';
import 'package:marketi/Core/error/failure.dart';
import 'package:marketi/Features/menu/data/data_source/user_remote_data_source.dart';
import 'package:marketi/Features/menu/data/model/user_model.dart';
import 'package:marketi/Features/menu/domain/repo/user_repo.dart';
import '../../../../Core/error/exceptions.dart';

class UserRepoImpl extends UserRepo{

  final UserBaseRemoteDataSource userBaseRemoteDataSource;
  UserRepoImpl({required this.userBaseRemoteDataSource});
  @override
  Future<Either<Failure, UserModel>> userData()async{
    try {
      final result= await userBaseRemoteDataSource.userData();
      return right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message!),);
    }
  }
}