import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Features/search/domain/use_case/search_use_case.dart';
import 'package:marketi/Features/search/presentation/view_manager/search_state.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit(this.searchUseCase) :super(SearchInitial());
  final SearchUseCase searchUseCase;
  Future<void> search({required String query})async{
    emit(SearchLoading());
    var result = await searchUseCase.call(query);
    result.fold((e) {
      emit(SearchFailure(errMessage: e.message));
    }, (searchModel) {
      emit(SearchSuccess(searchModel: searchModel));
    });
  }
}