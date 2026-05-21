
import 'package:marketi/Features/Auth/data/model/register_model.dart';

abstract class RegisterState{}
class RegisterInitial extends RegisterState{}
class RegisterLoading extends RegisterState{}
class RegisterFailure extends RegisterState{
  final String error;
  RegisterFailure({required this.error});
}
class RegisterSuccess extends RegisterState{
  final RegisterModel registerModel;
  RegisterSuccess({required this.registerModel});
}