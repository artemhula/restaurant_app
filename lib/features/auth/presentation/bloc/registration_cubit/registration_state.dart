part of 'registration_cubit.dart';

sealed class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

final class RegistrationInitial extends RegistrationState {}

final class RegistrationLoading extends RegistrationState {}

final class UserIsRegistered extends RegistrationState {}

final class UserIsNotRegistered extends RegistrationState {}

final class RegistrationSuccessful extends RegistrationState {}

final class RegistrationFailure extends RegistrationState {
  const RegistrationFailure(this.message);

  final String message;
}
