import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lyqx_test_task/core/error/failure.dart';
import 'package:lyqx_test_task/features/login/data/datasources/user_data_source.dart';
import 'package:lyqx_test_task/features/login/domain/entities/user_entity.dart';

import '../../domain/repositories/user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this.dataSource);

  final UserDataSource dataSource;

  @override
  Future<Either<Failure, String>> addUser(UserInfo param) async {
    try {
      final id = await dataSource.addUser(
        param,
      );
      return Right(id);
    } catch (e) {
      return const Left(
        LoginFailure('Failed to load data'),
      );
    }
  }
}
