import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/domain/entity/user.dart';
import 'package:restaurant/features/auth/domain/usecases/get_user.dart';
import 'package:restaurant/features/auth/domain/usecases/retrieve_last_user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.getUser, this.retrieveLastUser) : super(UserInitial());
  final GetUser getUser;
  final RetrieveLastUser retrieveLastUser;

  void receiveUser() async {
    emit(UserLoading());
    final userOrFailure = await getUser();
    userOrFailure.fold(
      (failure) => emit(UserFailure(message: failure.message)),
      (user) => emit(UserLoaded(user: user)),
    );
  }

  void recieveSavedUser() async {
    final user = await retrieveLastUser();
    user.fold(
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
}
