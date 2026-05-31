import 'package:marketi/Core/Api/api_consumer.dart';
import 'package:marketi/Core/Api/dio_consumer.dart';
import 'package:marketi/Core/Api/end_point.dart';
import 'package:marketi/Features/search/data/model/search_model.dart';

import '../../../../Core/error/error_model.dart';
import '../../../../Core/error/exceptions.dart';

abstract class BaseSearchRemoteDataSource{
  Future<List<SearchModel>> searchData({required String query});
}

class SearchRemoteDataSource extends BaseSearchRemoteDataSource{

  final ApiConsumer apiConsumer;

  SearchRemoteDataSource(this.apiConsumer);
  @override
  Future<List<SearchModel>> searchData({required String query})async{
    try {
      var response = await apiConsumer.post(EndPoint.searchProduct,
        data:{
          "search": query,
        });
      final List<dynamic> dataList = response['list'];
      print(dataList);
      return dataList.map((e) => SearchModel.fromJson(e)).toList();
    } on Exception catch (e) {
      throw ServerException(errModel: ErrorModel(message: e.toString()));
    }
  }
}