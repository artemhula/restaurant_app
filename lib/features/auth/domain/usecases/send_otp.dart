import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failure.dart';
import 'package:restaurant/features/auth/domain/repository/auth_repository.dart';

class SendOtp {
  SendOtp({required this.authRepository});

  final AuthRepository authRepository;

  Future<Either<Failure, String>> call(String phoneNumber) async {
    return await authRepository.sendOtp(phoneNumber);
  }
}
