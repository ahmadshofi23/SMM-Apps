part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class Loading extends LoginEvent {}

class LoginFailed extends LoginEvent {
  final String message;

  LoginFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthLogin extends LoginEvent {
  final String username;
  final String password;

  AuthLogin({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];
}
