import 'package:smm_apps/feature/profile/domain/entity/profile_entity.dart';

abstract class ProfileRepository {
  Future<ProfileEntity> getProfile();
}
