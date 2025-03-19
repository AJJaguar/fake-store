import 'package:lyqx_test_task/features/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.email,
    required super.password,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        email: map['email'],
        password: map['password'],

      );
}
