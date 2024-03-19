import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant/features/auth/data/models/user.dart';

abstract class FireStoreDataSource {
  Future<bool> checkExistingUser(String uid);
  Future<void> setUser(UserModel user);
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
    print(user.toJson());
    await _firestore.collection('users').doc(user.uid).set(user.toJson());
  }
}
