import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Features/Auth/presentation/view_manager/Register_cubit/register_state.dart';
import '../../../domain/use_case/register_use_case.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());
  final RegisterUseCase registerUseCase;
  Future<void> register(
    String name,
    String phone,
    String email,
    String password,
    String confirmPassword,
  ) async {
    emit(RegisterLoading());
    final result = await registerUseCase.call(
        name: name,
        phone: phone,
        email: email,
        password: password,
        confirmPassword: confirmPassword);
    result.fold((failure) {
      emit(RegisterFailure(error: failure.message));
    }, (registerModel) {
      emit(RegisterSuccess(registerModel: registerModel));
    });
  }
}
