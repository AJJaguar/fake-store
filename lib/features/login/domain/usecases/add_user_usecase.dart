import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../repositories/user_repository.dart';

@injectable
class AddUserEventUseCase implements UseCase<String, UserInfo> {
  AddUserEventUseCase(this.userRepository);
  final UserRepository userRepository;

  @override
  Future<Either<Failure, String>> call(UserInfo param) {
    return userRepository.addUser(param);
  }
}
