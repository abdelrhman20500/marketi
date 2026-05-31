import 'package:dartz/dartz.dart';
import 'package:marketi/Core/error/failure.dart';
import 'package:marketi/Features/search/data/data_source/search_data_source.dart';
import 'package:marketi/Features/search/data/model/search_model.dart';
import 'package:marketi/Features/search/domain/repo/search_repo.dart';

import '../../../../Core/error/exceptions.dart';

class SearchRepoImpl extends SearchRepo{
  final BaseSearchRemoteDataSource baseSearchRemoteDataSource;

  SearchRepoImpl({required this.baseSearchRemoteDataSource});
  @override
  Future<Either<Failure, List<SearchModel>>> getSearch({required String query})async{
    try {
      final result= await baseSearchRemoteDataSource.searchData(query: query);
      return right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.errModel.message ?? "Server error"),
      );
    }
  }

}