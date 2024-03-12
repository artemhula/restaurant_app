import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseDataSource {
  Future<void> sendSMS(String phoneNumber);
  Future<void> checkSMS(String verificationId, String smsCode);
}

class FirebaseDataSourceImpl implements FirebaseDataSource {
  FirebaseDataSourceImpl(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  Future<void> sendSMS(String phoneNumber) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Future<void> checkSMS(String verificationId, String smsCode) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    await _firebaseAuth.signInWithCredential(credential);
  }
}
