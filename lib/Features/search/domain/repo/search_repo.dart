import 'package:dartz/dartz.dart';
import 'package:marketi/Core/error/failure.dart';
import 'package:marketi/Features/search/data/model/search_model.dart';

abstract class SearchRepo{
  Future<Either<Failure, List<SearchModel>>> getSearch({required String query});
}