import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthDataSource {
  Future<String> sendSMS(String phoneNumber);
  Future<void> checkSMS(String verificationId, String smsCode);
  Future<User?> getUser();
}

class FirebaseAuthDataSourceImpl implements FirebaseAuthDataSource {
  FirebaseAuthDataSourceImpl(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  Future<String> sendSMS(String phoneNumber) {
    final completer = Completer<String>();
    _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        completer.complete(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );

    return completer.future;
  }

  @override
  Future<void> checkSMS(String verificationId, String smsCode) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    await _firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<User?> getUser() async {
    return _firebaseAuth.currentUser;
  }
}
