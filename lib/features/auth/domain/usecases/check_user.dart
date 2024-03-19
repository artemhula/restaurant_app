import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failure.dart';
import 'package:restaurant/features/auth/domain/repository/auth_repository.dart';

class CheckUser {
  final AuthRepository authRepository;

  CheckUser({required this.authRepository});

  Future<Either<Failure, bool>> call() async {
    return await authRepository.checkUser();
  }
}