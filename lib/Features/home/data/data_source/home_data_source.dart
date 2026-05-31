import 'package:marketi/Core/Api/api_consumer.dart';
import 'package:marketi/Core/Api/end_point.dart';
import 'package:marketi/Core/error/error_model.dart';
import 'package:marketi/Features/home/data/model/brands_model.dart';
import 'package:marketi/Features/home/data/model/category_model.dart';
import 'package:marketi/Features/home/data/model/product_model.dart';
import '../../../../Core/error/exceptions.dart';

abstract class BaseHomeRemoteDataSource{
  Future<List<ProductModel>> getProductDate();
  Future<List<CategoryModel>>getCategoryData();
  Future<List<BrandsModel>>getBrands();
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource{
  final ApiConsumer apiConsumer;

  HomeRemoteDataSource({required this.apiConsumer});
  @override
  Future<List<CategoryModel>> getCategoryData() async {
    try {
      final response = await apiConsumer.get(EndPoint.getAllCategory);
      final List<dynamic> dataList = response['list'];
      // print(dataList);
      return dataList.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (e) {
      throw ServerException(errModel: ErrorModel(message: e.toString()));
    }
  }

  @override
  Future<List<BrandsModel>> getBrands()async{
    try {
      final response = await apiConsumer.get(EndPoint.brands);
      final List<dynamic> dataList = response['list'];
      // print(dataList);
      return dataList.map((e) => BrandsModel.fromJson(e)).toList();
    } catch (e) {
      throw ServerException(errModel: ErrorModel(message: e.toString()));
    }
  }

  @override
  Future<List<ProductModel>> getProductDate()async{
    try {
      final response = await apiConsumer.get(EndPoint.products);
      final List<dynamic> dataList = response['list'];
      print(dataList);
      return dataList.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      throw ServerException(errModel: ErrorModel(message: e.toString()));
    }
  }
}