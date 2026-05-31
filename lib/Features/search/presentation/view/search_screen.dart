import 'package:flutter/material.dart';
import 'package:marketi/Features/search/presentation/view/widgets/search_list_view.dart';

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
    return const SearchListView();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SearchListView();
  }
}