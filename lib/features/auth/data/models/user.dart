import 'package:restaurant/features/auth/domain/entity/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.name,
    required super.birthday,
    required super.sex,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'birthday': birthday,
        'sex': sex,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'],
        name: json['name'],
        birthday: json['birthday'].toDate(),
        sex: json['sex'],
      );
}
