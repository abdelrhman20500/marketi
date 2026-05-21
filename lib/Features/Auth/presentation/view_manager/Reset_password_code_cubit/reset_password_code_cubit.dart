import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/reset_password_code_use_case.dart';
import 'reset_password_code_state.dart';

class ResetPasswordCodeCubit extends Cubit<ResetPasswordCodeState> {
  final ResetPasswordCodeUseCase resetPasswordCodeUseCase;

  ResetPasswordCodeCubit(this.resetPasswordCodeUseCase)
      : super(ResetPasswordCodeInitial());

  Future<void> sendResetCode(String email) async {
    emit(ResetPasswordCodeLoading());

    final result = await resetPasswordCodeUseCase.call(email: email);

    result.fold(
          (failure) {
        emit(ResetPasswordCodeFailure(error: failure.message));
      },
          (resetPasswordCodeModel) {
        emit(ResetPasswordCodeSuccess(
            resetPasswordCodeModel: resetPasswordCodeModel));
      },
    );
  }
}
