import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant/features/auth/data/models/user.dart';

abstract class LocalDatasource {
  Future<void> saveUser(Map<String, dynamic> userJson);
  Future<UserModel?> getUser();
  Future<void> removeUser();
}

class LocalDatasourceImpl implements LocalDatasource {
  LocalDatasourceImpl({required Box<Map<String, dynamic>> box}): _box = box;
  final Box<Map<String, dynamic>> _box;

  @override
  Future<void> saveUser(Map<String, dynamic> userJson) async {
    await _box.put(0, userJson);
  }

  @override
  Future<UserModel?> getUser() async {
    final userJson = _box.get(0);
    if (userJson != null) {
      return UserModel.fromJson(userJson);
    }
    return null;
  }
  
  @override
  Future<void> removeUser() async {
   await _box.delete(0); 
  }
}
