import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant/features/auth/data/models/user.dart';

abstract class LocalDatasource {
  Future<void> saveUser(Map userJson);
  Future<UserModel?> getUser();
  Future<void> removeUser();
}

class LocalDatasourceImpl implements LocalDatasource {
  LocalDatasourceImpl({required Box box}): _box = box;
  final Box _box;

  @override
  Future<void> saveUser(Map userJson) async {
    await _box.put(0, userJson);
  }

  @override
  Future<UserModel?> getUser() async {
    final userJson = _box.get(0);
    if (userJson != null) {
      return UserModel.fromJson(userJson.cast<String, dynamic>());
    }
    return null;
  }
  
  @override
  Future<void> removeUser() async {
   await _box.delete(0); 
  }
}
