import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String name;
  final bool sex;

  const UserEntity(
      {required this.uid,
      required this.name,
      required this.sex});

  @override
  List<Object?> get props => [uid, name, sex];
}
