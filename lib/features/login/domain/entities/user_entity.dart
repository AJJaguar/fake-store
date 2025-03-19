import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    this.id,
    this.email,
    required this.username,
    required this.password,
  });

  final num? id;
  final String username;
  final String? email;
  final String password;

  @override
  List<Object?> get props => [
        id,
        username,
        email,
        password,
      ];
}
