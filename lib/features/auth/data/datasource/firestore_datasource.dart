import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant/features/auth/data/models/user.dart';

abstract class FireStoreDataSource {
  Future<bool> checkExistingUser(String uid);
  Future<void> setUser(UserModel user);
  Future<UserModel> getUser(String uid);
}

class FireStoreDataSourceImpl implements FireStoreDataSource {
  FireStoreDataSourceImpl(this._firestore);
  final FirebaseFirestore _firestore;

  @override
  Future<bool> checkExistingUser(String uid) async {
    final snapshot = await _firestore.collection('users').doc(uid).get();
    return snapshot.exists;
  }

  @override
  Future<void> setUser(UserModel user) async {
    await _firestore.collection('users').doc(user.uid).set(user.toJson());
  }

  @override
  Future<UserModel> getUser(String uid) async {
    final snapshot = await _firestore.collection('users').doc(uid).get();
    final data = snapshot.data();
    if (data != null) {
      return UserModel.fromJson(data);
    } else {
      throw Exception();
    }
  }
}
