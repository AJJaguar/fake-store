part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class AddUserEvent extends LoginEvent {
  const AddUserEvent({required this.param});
  final UserInfo param;

  @override
  List<Object?> get props => [param];
}
