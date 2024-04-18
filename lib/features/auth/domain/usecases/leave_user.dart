import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failure.dart';
import 'package:restaurant/features/auth/domain/repository/auth_repository.dart';

class LeaveUser {
   LeaveUser({required this.authRepository});

  final AuthRepository authRepository;
  Future<Either<Failure, void>> call () async {
    return authRepository.leaveUser();
  }
}