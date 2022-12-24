import 'package:smm_apps/feature/login/data/models/login_models.dart';
import 'package:smm_apps/feature/login/domain/entity/LoginResponseEntity.dart';
import 'package:smm_apps/feature/login/domain/repository/login_repository.dart';

abstract class LoginUseCase {
  Future<LoginResponseEntity> login(
    String username,
    String password,
  );
}

class LoginUseCaseImpl implements LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCaseImpl({required this.loginRepository});
  @override
  Future<LoginResponseEntity> login(String username, String password) async {
    return await loginRepository.login(username, password);
  }
}
