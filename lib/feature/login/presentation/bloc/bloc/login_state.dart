part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool? isLoading;
  final String? username;
  final String? password;

  const LoginState({
    this.isLoading,
    this.username,
    this.password,
  });

  LoginState copyWith({
    bool? isLoading,
    String? username,
    String? password,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      username: username ?? this.username,
      password: password ?? password,
    );
  }

  @override
  List<Object?> get props => [username, password, isLoading];
}
