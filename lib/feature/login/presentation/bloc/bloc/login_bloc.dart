import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smm_apps/feature/login/domain/entity/LoginResponseEntity.dart';
import 'package:smm_apps/feature/login/domain/usecase/login_usecase.dart';
import 'dart:async';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase useCase;

  LoginBloc({required this.useCase}) : super(AuthInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is AuthLogin) {
      try {
        yield AuthLoading();
        final response = await useCase.login(event.username, event.password);

        if (response.status == 'success') {
          yield AuthLoading();
          yield AuthSuccess(loginResponseEntity: response);
        } else {
          yield AuthFailed(message: 'Login Failed');
        }
      } catch (e) {
        yield AuthFailed(message: e.toString());
      }
    }
  }
}
