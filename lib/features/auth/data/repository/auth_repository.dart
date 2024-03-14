import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failure.dart';
import 'package:restaurant/features/auth/data/datasource/firebase_datasource.dart';
import 'package:restaurant/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.datasource);

  final FirebaseDataSource datasource;

  @override
  Future<Either<Failure, String>> sendOtp(String phoneNumber) async {
    try {
      final verificationId = await datasource.sendSMS(phoneNumber);
      return Right(verificationId);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> checkOtp(
      String verificationId, String smsCode) async {
    try {
      await datasource.checkSMS(verificationId, smsCode);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
