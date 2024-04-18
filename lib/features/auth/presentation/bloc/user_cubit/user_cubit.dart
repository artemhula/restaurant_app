import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/domain/entity/user.dart';
import 'package:restaurant/features/auth/domain/usecases/get_user.dart';
import 'package:restaurant/features/auth/domain/usecases/leave_user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.getUser, this.leaveUser) : super(UserInitial());
  final GetUser getUser;
  final LeaveUser leaveUser;

  void receiveUser() async {
    emit(UserLoading());
    final userOrFailure = await getUser();
    userOrFailure.fold(
      (failure) => emit(UserFailure(message: failure.message)),
      (user) {
        if (user != null) {
          emit(UserLoaded(user: user));
        } else {
          emit(UserNotLoaded());
        }
      },
    );
  }

  void logOut() async {
    emit(UserLoading());
    final process = await leaveUser();
    process.fold(
      (failure) => emit(UserFailure(message: failure.message)),
      (success) => emit(UserNotLoaded()),
    );
  }
}
