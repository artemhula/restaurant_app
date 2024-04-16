part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserNotLoaded extends UserState {}

final class UserLoaded extends UserState {
  const UserLoaded({required this.user});
  final UserEntity user;

  @override
  List<Object> get props => [user];
}

final class UserNotLoaded extends UserState {}

final class UserFailure extends UserState {
  const UserFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
