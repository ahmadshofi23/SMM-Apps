import 'package:smm_apps/feature/login/data/models/login_models.dart';
import 'package:smm_apps/feature/login/domain/entity/LoginResponseEntity.dart';

abstract class LoginRepository {
  Future<LoginResponseEntity> login(String username, String password);
}
