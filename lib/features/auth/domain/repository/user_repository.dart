import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failure.dart';

abstract class UserRepository{
  Future<Either<Failure, bool>> verifyNumber(String int);
  Future<Either<Failure, bool>> checkReigstration();
  Future<Either<Failure, bool>> registerUser();
  Future<Either<Failure, bool>> loginUser();
}