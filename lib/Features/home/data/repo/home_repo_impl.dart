import 'package:dartz/dartz.dart';
import 'package:marketi/Core/error/exceptions.dart';
import 'package:marketi/Core/error/failure.dart';
import 'package:marketi/Features/home/data/data_source/home_data_source.dart';
import 'package:marketi/Features/home/data/model/brands_model.dart';
import 'package:marketi/Features/home/data/model/category_model.dart';
import 'package:marketi/Features/home/data/model/product_model.dart';
import 'package:marketi/Features/home/domain/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo{
  final BaseHomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategory()async{
    try {
      final result= await homeRemoteDataSource.getCategoryData();
      return right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.errModel.message ?? "Server error"),
      );
    }
  }

  @override
  Future<Either<Failure, List<BrandsModel>>> getBrands()async{
    try {
      final result= await homeRemoteDataSource.getBrands();
      return right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.errModel.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProduct()async{
    try {
      final result= await homeRemoteDataSource.getProductDate();
      return right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.errModel.message!),
      );
    }
  }

}