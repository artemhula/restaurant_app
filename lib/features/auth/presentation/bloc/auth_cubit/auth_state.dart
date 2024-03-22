part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthOtpSended extends AuthState {
  const AuthOtpSended({required this.phoneNumber});
  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

final class AuthOtpVerified extends AuthState {}

final class AuthFailure extends AuthState {
  const AuthFailure(this.message);
  final String message;
  
  @override
  List<Object> get props => [message];
}
