
import 'package:marketi/Features/Auth/data/model/login_model.dart';

abstract class LoginState{}
class LoginInitial extends LoginState{}
class LoginLoading extends LoginState{}
class LoginFailure extends LoginState{
  final String error;
  LoginFailure({required this.error});
}
class LoginSuccess extends LoginState{
  final LoginModel loginModel;
  LoginSuccess({required this.loginModel});
}