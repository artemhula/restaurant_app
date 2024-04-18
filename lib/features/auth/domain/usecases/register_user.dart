import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failure.dart';
import 'package:restaurant/features/auth/domain/repository/auth_repository.dart';

class RegisterUser {
  RegisterUser({required this.authRepository});
  final AuthRepository authRepository;
  
  Future<Either<Failure, void>> call(String name, bool sex) async {
    return await authRepository.registerUser(name, sex);
  }
}
