import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Features/menu/domain/use_case/user_use_case.dart';
import 'package:marketi/Features/menu/presentation/view_manager/user_state.dart';
import '../../../../Core/base_use_case/base_use_case.dart';

class UserCubit extends Cubit<UserState>{
  UserCubit(this.userUseCase): super(UserInitial());

  final UserUseCase userUseCase;
  Future<void> getUserData() async {
    emit(UserLoading());
    var result = await userUseCase.call(const NoParameters());
    result.fold((e) {
      emit(UserFailure(error: e.message));
    }, (userModel) {
      emit(UserSuccess(userModel: userModel));
    });
  }
}