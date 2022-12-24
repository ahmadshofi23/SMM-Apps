import 'package:smm_apps/feature/profile/domain/entity/profile_entity.dart';
import 'package:smm_apps/feature/profile/domain/repository/profile_repository.dart';

abstract class ProfileUseCase {
  Future<ProfileEntity> getProfile();
}

class ProfileUseCaseImpl implements ProfileUseCase {
  final ProfileRepository profileRepository;

  ProfileUseCaseImpl({required this.profileRepository});

  @override
  Future<ProfileEntity> getProfile() => profileRepository.getProfile();
}
