import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/user_entity.dart';

typedef UserInfo = ({String email, String password});

abstract class UserRepository {
  Future<Either<Failure, String>> addUser(
    UserInfo param,
  );
}
