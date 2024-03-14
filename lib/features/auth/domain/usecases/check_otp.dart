import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failure.dart';
import 'package:restaurant/features/auth/domain/repository/auth_repository.dart';

class CheckOtp {
  CheckOtp({required this.authRepository});

  final AuthRepository authRepository;

  Future<Either<Failure, void>> call(
      {required String verificationId, required String smsCode}) async {
    return await authRepository.checkOtp(verificationId, smsCode);
  }
}
