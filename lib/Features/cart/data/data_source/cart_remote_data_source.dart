import 'package:marketi/Core/Api/api_consumer.dart';
import 'package:marketi/Features/cart/data/model/add_or_remove_cart_model.dart';
import 'package:marketi/Features/home/data/model/product_model.dart';
import '../../../../Core/Api/end_point.dart';
import '../../../../Core/error/error_model.dart';
import '../../../../Core/error/exceptions.dart';

abstract class CartBaseRemoteDataSource {
  Future<List<ProductModel>> getCart();
  Future<AddOrRemoveCartModel> addCart({required String id});
  Future<AddOrRemoveCartModel> removeCart({required String id});
}

class CartRemoteDataSource extends CartBaseRemoteDataSource{
  final ApiConsumer apiConsumer;

  CartRemoteDataSource({required this.apiConsumer});
  @override
  Future<AddOrRemoveCartModel> addCart({required String id})async{
    try {
      var response = await apiConsumer.post(EndPoint.addCart,
        data: {
          "productId":id
        },);
      final addCart = AddOrRemoveCartModel.fromJson(response);
      print("#############################");
      print(addCart);
      return addCart;
    }  catch (e) {
      throw ServerException(errModel: ErrorModel(message: e.toString()));
    }
  }

  @override
  Future<AddOrRemoveCartModel> removeCart({required String id})async{
    try {
      var response = await apiConsumer.delete(EndPoint.removeCart,
        data: {
          "productId":id
        },);
      final removeCart = AddOrRemoveCartModel.fromJson(response);
      print("#############################");
      print(removeCart);
      return removeCart;
    }  catch (e) {
      throw ServerException(errModel: ErrorModel(message: e.toString()));
    }
  }

  @override
  Future<List<ProductModel>> getCart()async{
    try {
      final response = await apiConsumer.get(EndPoint.cart);
      final List<dynamic> dataList = response['list'];
      print("#############################");
      print(dataList);
      return dataList.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      throw ServerException(errModel: ErrorModel(message: e.toString()));
    }
  }
  
}