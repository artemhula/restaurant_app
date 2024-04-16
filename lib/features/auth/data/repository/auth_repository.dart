import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failure.dart';
import 'package:restaurant/features/auth/data/datasource/firebase_auth_datasource.dart';
import 'package:restaurant/features/auth/data/datasource/firestore_datasource.dart';
import 'package:restaurant/features/auth/data/datasource/local_datasource.dart';
import 'package:restaurant/features/auth/data/models/user.dart';
import 'package:restaurant/features/auth/domain/entity/user.dart';
import 'package:restaurant/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._firebaseAuthDataSource, this._firestoreDataSource,
      this._localDatasource);

  final FirebaseAuthDataSource _firebaseAuthDataSource;
  final FireStoreDataSource _firestoreDataSource;
  final LocalDatasource _localDatasource;

  @override
  Future<Either<Failure, String>> sendOtp(String phoneNumber) async {
    try {
      final verificationId = await _firebaseAuthDataSource.sendSMS(phoneNumber);
      return Right(verificationId);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> checkOtp(
      String verificationId, String smsCode) async {
    try {
      await _firebaseAuthDataSource.checkSMS(verificationId, smsCode);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkUser() async {
    try {
      final user = await _firebaseAuthDataSource.getUser();
      return Right(user != null &&
          await _firestoreDataSource.checkExistingUser(user.uid));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> registerUser(
      String name, bool sex, DateTime birthday) async {
    try {
      final user = await _firebaseAuthDataSource.getUser();
      if (user != null) {
        _firestoreDataSource.setUser(
          UserModel(
            uid: user.uid,
            name: name,
            birthday: birthday,
            sex: sex,
          ),
        );
      }
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getUser() async {
    try {
      final userFromLocal = await _localDatasource.getUser();
      if (userFromLocal != null) {
        return Right(userFromLocal);
      }

      final userFromFirebase = await _firebaseAuthDataSource.getUser();
      final userFromFirestore = userFromFirebase != null
          ? await _firestoreDataSource.getUser(userFromFirebase.uid)
          : null;

      if (userFromFirestore != null) {
        await _localDatasource.saveUser(userFromFirestore.toJson());
        return Right(userFromFirestore);
      }

      return const Left(Failure('User not found'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
