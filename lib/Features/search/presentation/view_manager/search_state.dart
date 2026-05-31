import 'package:marketi/Features/search/data/model/search_model.dart';

abstract class SearchState{}
class SearchInitial extends SearchState{}
class SearchLoading extends SearchState{}
class SearchFailure extends SearchState{
  final String error;
  SearchFailure({required this.error});
}
class SearchSuccess extends SearchState{
  final List<SearchModel> searchModel;
  SearchSuccess({required this.searchModel});
}