import 'package:dio/dio.dart';
import 'package:marketi/Core/Api/api_consumer.dart';
import 'package:marketi/Core/Api/end_point.dart';
import 'package:marketi/Features/search/data/model/search_model.dart';

abstract class BaseSearchRemoteDataSource{
  Future<List<SearchModel>> searchData({required String query});
}

class SearchRemoteDataSource extends BaseSearchRemoteDataSource{

  final ApiConsumer apiConsumer;

  SearchRemoteDataSource(this.apiConsumer);
  @override
  Future<List<SearchModel>> searchData({required String query}) async {
    try {
      var response = await apiConsumer.post(
        EndPoint.searchProduct,
        data: {"search": query},
      );
      if (response is Map<String, dynamic>) {
        if (response['message'] == "No results found.") {
          return []; //
        }
        final List<dynamic> dataList = response['list'] ?? [];
        return dataList.map((e) => SearchModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return []; // 404 = No results
      }
      rethrow;
    }
  }}