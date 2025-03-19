part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState({
    this.user,
  });
  final UserEntity? user;

  @override
  List<Object?> get props => [user];
}

class LoginInitial extends LoginState {
  const LoginInitial({super.user});
}
class LoginLoading extends LoginState {
  const LoginLoading({super.user});
}

class LoginLoaded extends LoginState {
  const LoginLoaded({super.user});
}

class LoginEventFailed extends LoginState {
  final Failure failure;
  const LoginEventFailed({required this.failure, required super.user});
}



