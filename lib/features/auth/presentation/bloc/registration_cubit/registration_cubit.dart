import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant/features/auth/domain/usecases/check_user.dart';
import 'package:restaurant/features/auth/domain/usecases/register_user.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this.checkUser, this.registerUser)
      : super(RegistrationInitial());
  final CheckUser checkUser;
  final RegisterUser registerUser;

  void checkIsUserRegistered() async {
    final isRegistered = await checkUser();
    isRegistered.fold(
      (failure) => emit(RegistrationFailure(failure.message)),
      (isRegistered) {
        if (isRegistered) {
          emit(UserIsRegistered());
        } else {
          emit(UserIsNotRegistered());
        }
      },
    );
  }

  void register(String name, bool sex, DateTime birthday) async {
    emit(RegistrationLoading());
    final registerOrFaliure = await registerUser(name, sex, birthday);
    registerOrFaliure.fold(
      (failure) => emit(RegistrationFailure(failure.message)),
      (success) => emit(RegistrationSuccessful()),
    );
  }
}
