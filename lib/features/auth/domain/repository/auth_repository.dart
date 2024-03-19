import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> sendOtp(String phoneNumber);
  Future<Either<Failure, void>> checkOtp(String verificationId, String smsCode);
  Future<Either<Failure, bool>> checkUser();
  Future<Either<Failure, void>> registerUser(String name, bool sex, DateTime birthday);
}
