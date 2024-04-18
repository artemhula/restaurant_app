import 'package:restaurant/features/auth/domain/entity/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.name,
    required super.sex,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'sex': sex,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'],
        name: json['name'],
        sex: json['sex'],
      );
}
