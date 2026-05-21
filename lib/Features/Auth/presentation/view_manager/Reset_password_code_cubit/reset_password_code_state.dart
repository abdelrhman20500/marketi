import 'package:marketi/Features/Auth/data/model/reset_password_code_model.dart';

abstract class ResetPasswordCodeState {}

class ResetPasswordCodeInitial extends ResetPasswordCodeState {}

class ResetPasswordCodeLoading extends ResetPasswordCodeState {}

class ResetPasswordCodeFailure extends ResetPasswordCodeState {
  final String error;
  ResetPasswordCodeFailure({required this.error});
}

class ResetPasswordCodeSuccess extends ResetPasswordCodeState {
  final ResetPasswordCodeModel resetPasswordCodeModel;
  ResetPasswordCodeSuccess({required this.resetPasswordCodeModel});
}
