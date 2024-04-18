import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant/features/auth/domain/entity/user.dart';
import 'package:restaurant/features/auth/domain/usecases/check_user.dart';
import 'package:restaurant/features/auth/domain/usecases/get_user.dart';
import 'package:restaurant/features/auth/domain/usecases/register_user.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this.checkUser, this.registerUser, this.getUser)
      : super(RegistrationInitial());
  final CheckUser checkUser;
  final RegisterUser registerUser;
  final GetUser getUser;

  void checkIsUserRegistered() async {
    final isRegistered = await checkUser();
    emit(RegistrationLoading());
    isRegistered.fold(
      (failure) => emit(RegistrationFailure(failure.message)),
      (isRegistered) async {
        if (!isRegistered) {
          emit(UserIsNotRegistered());
          return;
        }
        _getUserAndEmitState();
      },
    );
  }

  void register(String name, bool sex) async {
    emit(RegistrationLoading());
    final registerOrFaliure = await registerUser(name, sex);
    registerOrFaliure.fold(
      (failure) => emit(RegistrationFailure(failure.message)),
      (success) => _getUserAndEmitState(),
    );
  }

  void _getUserAndEmitState() async {
    final user = await getUser();
    user.fold(
      (failure) => emit(RegistrationFailure(failure.message)),
      (user) {
        if (user != null) {
          emit(UserIsRegistered(user: user));
        } else {
          emit(const RegistrationFailure('User not found'));
        }
      },
    );
  }
}