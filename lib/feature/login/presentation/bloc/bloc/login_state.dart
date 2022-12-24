part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends LoginState {}

class AuthLoading extends LoginState {}

class AuthFailed extends LoginState {
  final String message;

  AuthFailed({required this.message});

  @override
  List<Object?> get props => [message];
}

class AuthSuccess extends LoginState {
  final LoginResponseEntity loginResponseEntity;
  AuthSuccess({required this.loginResponseEntity});

  @override
  List<Object?> get props => [loginResponseEntity];
}

// class LoginState extends Equatable {
//   final bool? isLoading;
//   final String? username;
//   final String? password;
//   final int? statusCode;
//   final LoginResponseEntity? loginResponseEntity;

//   const LoginState({
//     this.isLoading,
//     this.username,
//     this.password,
//     this.statusCode,
//     this.loginResponseEntity,
//   });

//   LoginState copyWith({
//     bool? isLoading,
//     String? username,
//     String? password,
//     int? statusCode,
//     LoginResponseEntity? loginResponseEntity,
//   }) {
//     return LoginState(
//       isLoading: isLoading ?? this.isLoading,
//       username: username ?? this.username,
//       password: password ?? this.password,
//       statusCode: statusCode ?? this.statusCode,
//       loginResponseEntity: loginResponseEntity ?? this.loginResponseEntity,
//     );
//   }

//   @override
//   List<Object?> get props => [username, password, isLoading];
// }
