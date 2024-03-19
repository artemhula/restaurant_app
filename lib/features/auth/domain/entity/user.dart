import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String name;

  final DateTime birthday;
  final bool sex;

  const UserEntity(
      {required this.uid,
      required this.name,

      required this.birthday,
      required this.sex});

  @override
  List<Object?> get props => [uid, name, birthday, sex];
}
