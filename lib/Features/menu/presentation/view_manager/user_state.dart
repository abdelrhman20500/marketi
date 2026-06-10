import 'package:marketi/Features/menu/data/model/user_model.dart';

abstract class UserState{}
class UserInitial extends UserState{}
class UserLoading extends UserState{}
class UserFailure extends UserState{
  final String error;
  UserFailure({required this.error});
}
class UserSuccess extends UserState{
  final UserModel userModel;
  UserSuccess({required this.userModel});
}