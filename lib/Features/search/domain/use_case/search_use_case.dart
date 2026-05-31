import 'package:dartz/dartz.dart';
import 'package:marketi/Core/base_use_case/base_use_case.dart';
import 'package:marketi/Core/error/failure.dart';

import 'package:marketi/Features/search/data/model/search_model.dart';
import 'package:marketi/Features/search/domain/repo/search_repo.dart';

class SearchUseCase extends BaseUseCase<List<SearchModel>, String> {
  final SearchRepo searchRepo;

  SearchUseCase(this.searchRepo);

  @override
  Future<Either<Failure, List<SearchModel>>> call([String? query])async{
   return await searchRepo.getSearch(query: query!);
  }
}