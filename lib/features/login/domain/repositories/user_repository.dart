import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';



typedef UserInfo = ({String email, String password});

abstract class UserRepository {
  Future<Either<Failure, String>> addUser(
    UserInfo param,
  );
}
