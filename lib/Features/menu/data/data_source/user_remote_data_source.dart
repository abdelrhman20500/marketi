import 'dart:convert';
import 'package:marketi/Core/Api/api_consumer.dart';
import 'package:marketi/Core/Api/end_point.dart';
import 'package:marketi/Features/menu/data/model/user_model.dart';
import '../../../../Core/error/error_model.dart';
import '../../../../Core/error/exceptions.dart';

abstract class UserBaseRemoteDataSource {
  Future<UserModel> userData();
}
class UserRemoteDataSource extends UserBaseRemoteDataSource{
  final ApiConsumer apiConsumer;
  UserRemoteDataSource({required this.apiConsumer});
  @override
  Future<UserModel> userData()async{
   try {
     var response = await apiConsumer.get(EndPoint.getUserData);
     Map<String, dynamic> jsonDate = jsonDecode(response.body);
     print(jsonDate);
     UserModel userModel = UserModel.fromJson(jsonDate);
     return userModel;
   } catch (e) {
     throw ServerException(errModel: ErrorModel(message: e.toString()));
   }
  }
}