import 'package:marketi/Features/search/data/model/search_model.dart';

abstract class SearchState{}
class SearchInitial extends SearchState{}
class SearchLoading extends SearchState{}
class SearchFailure extends SearchState{
  final String errMessage;
  SearchFailure({required this.errMessage});
}
class SearchSuccess extends SearchState{
  final List<SearchModel> searchModel;
  SearchSuccess({required this.searchModel});
}