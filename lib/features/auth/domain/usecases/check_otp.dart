import 'package:restaurant/features/auth/domain/repository/auth_repository.dart';

class CheckOtp {
  CheckOtp({required this.authRepository});

  final AuthRepository authRepository;

  Future<void> call(String verificationId, String smsCode) async {
    await authRepository.checkOtp(verificationId, smsCode);
  }
}
