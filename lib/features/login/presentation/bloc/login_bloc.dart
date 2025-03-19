import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lyqx_test_task/core/error/failure.dart';
import 'package:lyqx_test_task/features/login/domain/entities/user_entity.dart';
import 'package:lyqx_test_task/features/login/domain/repositories/user_repository.dart';
import 'package:lyqx_test_task/features/login/domain/usecases/add_user_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
    this._addUserEventUseCase,
  ) : super(const LoginInitial()) {
    on<AddUserEvent>(_onAddUserEvent);
  }

  final AddUserEventUseCase _addUserEventUseCase;

  FutureOr<void> _onAddUserEvent(
    AddUserEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      const LoginLoading(),
    );

    await _addUserEventUseCase(event.param).then(
      (value) => value.fold(
          (failure) => emit(
                LoginEventFailed(user: state.user, failure: failure),
              ), (user) {
        final newState = LoginLoaded(user: state.user);
        emit(newState);
      }),
    );
  }
}
