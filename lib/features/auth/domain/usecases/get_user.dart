import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failure.dart';
import 'package:restaurant/features/auth/domain/entity/user.dart';
import 'package:restaurant/features/auth/domain/repository/auth_repository.dart';

class GetUser {
  GetUser({required this.authRepository});
  final AuthRepository authRepository;

  Future<Either<Failure, UserEntity?>> call() async {
    return await authRepository.getUser();
  }
}
