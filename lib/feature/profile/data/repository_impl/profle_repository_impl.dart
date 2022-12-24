import 'package:flutter/material.dart';
import 'package:smm_apps/feature/profile/data/remote/local/LocalProfileDataSource.dart';
import 'package:smm_apps/feature/profile/domain/entity/profile_entity.dart';
import 'package:smm_apps/feature/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final LocalProfileDataSource localDataSource;

  ProfileRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<ProfileEntity> getProfile() async {
    final response = await localDataSource.getProfile();
    return ProfileEntity(
      id: response.id,
      name: response.name,
      email: response.email,
      phone: response.phone,
      image: response.imageSrc,
      username: response.username,
    );
  }
}
