import 'package:equatable/equatable.dart';


abstract class Failure extends Equatable {
  const Failure(this.message);

  final String message;
}



class LoginFailure extends Failure {
  const LoginFailure(super.message);
  
  @override
  List<Object?> get props => [super.message];
}