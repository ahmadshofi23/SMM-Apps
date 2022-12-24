import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smm_apps/feature/profile/data/models/profile_models.dart';

abstract class LocalProfileDataSource {
  Future<ProfileModels> getProfile();
}

class LoginProfileDataSouce implements LocalProfileDataSource {
  @override
  Future<ProfileModels> getProfile() async {
    final SharedPreferences getProfile = await SharedPreferences.getInstance();
    String? encodeDataUser = getProfile.getString('user');
    Map<String, dynamic> dataUser = json.decode(encodeDataUser!);
    return ProfileModels.fromJson(dataUser);
  }
}
