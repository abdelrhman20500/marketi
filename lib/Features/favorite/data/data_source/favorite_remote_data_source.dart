import 'package:marketi/Features/favorite/data/model/add_or_remove_favorite_model.dart';
import 'package:marketi/Features/home/data/model/product_model.dart';
import '../../../../Core/Api/api_consumer.dart';
import '../../../../Core/Api/end_point.dart';
import '../../../../Core/error/error_model.dart';
import '../../../../Core/error/exceptions.dart';

abstract class FavoriteBaseRemoteDataSource{
  Future<List<ProductModel>> favorite();
  Future<AddOrRemoveFavoriteModel> addFavorite({required String id});
  Future<AddOrRemoveFavoriteModel> removeFavorite({required String id});

}

class AddToFavoriteRemoteDataSource extends FavoriteBaseRemoteDataSource{
  final ApiConsumer apiConsumer;

  AddToFavoriteRemoteDataSource({required this.apiConsumer});
  @override
  Future<AddOrRemoveFavoriteModel> addFavorite({required String id})async{
    try {
      var response = await apiConsumer.post(EndPoint.addFavorite,
        data: {
        "productId":id
        },);
      final addFavorite = AddOrRemoveFavoriteModel.fromJson(response);
      return addFavorite;
    }  catch (e) {
      throw ServerException(errModel: ErrorModel(message: e.toString()));
    }
  }

  @override
  Future<List<ProductModel>> favorite()async{
    try {
      final response = await apiConsumer.get(EndPoint.favorite);
      final List<dynamic> dataList = response['list'];
      return dataList.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      throw ServerException(errModel: ErrorModel(message: e.toString()));
    }
  }

  @override
  Future<AddOrRemoveFavoriteModel> removeFavorite({required String id})async{
    try {
      var response = await apiConsumer.delete(EndPoint.removeFavorite,
        data: {
          "productId":id
        },);
      final addFavorite = AddOrRemoveFavoriteModel.fromJson(response);
      return addFavorite;
    }  catch (e) {
      throw ServerException(errModel: ErrorModel(message: e.toString()));
    }
  }

}