import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> sendOtp(String phoneNumber);
  Future<Either<Failure, void>> checkOtp(String verificationId, String smsCode);
}
