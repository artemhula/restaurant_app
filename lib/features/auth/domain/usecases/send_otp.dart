import 'package:restaurant/features/auth/domain/repository/auth_repository.dart';

class SendOtp {
  SendOtp({required this.authRepository});

  final AuthRepository authRepository;

  Future<void> call(String phoneNumber) async {
    await authRepository.sendOtp(phoneNumber);
  }
}
