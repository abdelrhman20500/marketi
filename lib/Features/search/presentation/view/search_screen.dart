import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Core/Api/dio_consumer.dart';
import 'package:marketi/Features/search/data/data_source/search_data_source.dart';
import 'package:marketi/Features/search/data/repo/search_repo_impl.dart';
import 'package:marketi/Features/search/domain/use_case/search_use_case.dart';
import 'package:marketi/Features/search/presentation/view/widgets/search_list_view.dart';
import 'package:marketi/Features/search/presentation/view_manager/search_cubit.dart';
import 'package:marketi/Features/search/presentation/view_manager/search_state.dart';

class SearchScreen extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(onPressed: ()
    {
      buildResults(context);
    }, icon: const Icon(Icons.search),color: Colors.black54);
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: ()
    {
      Navigator.pop(context);
    }, icon: const Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return NewWidget(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return NewWidget(query: query);
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({super.key, required this.query,});

  final String query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchUseCase(SearchRepoImpl(baseSearchRemoteDataSource:
      SearchRemoteDataSource(DioConsumer(dio: Dio(),),),),),)..search(query: query),
      child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if(state is SearchLoading){
              const Center(child: CircularProgressIndicator(),);
            }else if(state is SearchFailure){
              print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
              print(state.error);
              return Center(
                child: Text(
                  state.error,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }else if(state is SearchSuccess){
              return SearchListView(model: state.searchModel,);
            }
            return const Center(child: CircularProgressIndicator(),);
          },
      ),
    );
  }
}