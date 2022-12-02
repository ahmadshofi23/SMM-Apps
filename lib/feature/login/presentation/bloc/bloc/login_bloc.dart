import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smm_apps/feature/login/domain/usecase/login_usecase.dart';
import 'dart:async';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase useCase;

  LoginBloc({required this.useCase}) : super(const LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoggedIn) {
      // await useCase.login(event.username, event.password);s
      yield* _login(event.username, event.password);
    }
  }

  Stream<LoginState> _login(String username, String password) async* {
    try {
      await useCase.login(username, password);
    } catch (e) {}
    // yield _login(username, password);
  }
}


// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final LoginUseCase loginUseCase;

//   LoginBloc({required this.loginUseCase}) : super(const LoginState()) {
//     @override
//     Stream<LoginState> mapEventToState(LoginEvent event) async* {
//       if (event is LoggedIn) {
//         print('awal masuk bloc');
//         yield state.copyWith(
//           isLoading: true,
//         );
//         try {
//           print('masuk try login');
//           final reponse =
//               await loginUseCase.login(event.username, event.password);
//         } catch (e) {
//           print(e.toString());
//         }
//         yield state.copyWith(
//           isLoading: false,
//         );
//       }
//     }
//   }
// }
