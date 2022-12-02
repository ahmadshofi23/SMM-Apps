import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationPreferences {
  final SharedPreferences sharedPreferences;

  AuthenticationPreferences({required this.sharedPreferences});

  Future<void> saveToken(String token) async {
    await sharedPreferences.setString('token', token);
  }

  Future<String?> getToken() async {
    return sharedPreferences.getString('token');
  }
}
