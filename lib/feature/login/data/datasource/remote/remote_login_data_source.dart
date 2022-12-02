import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smm_apps/feature/login/data/datasource/local/authentication_preferences.dart';
import 'package:smm_apps/feature/login/data/models/login_models.dart';
import 'package:http/http.dart' as http;

abstract class RemoteLoginDataSource {
  Future<LoginModels> login(String username, String password);
}

class RemoteLoginDataSourceImpl extends RemoteLoginDataSource {
  RemoteLoginDataSourceImpl();

  @override
  Future<LoginModels> login(String username, String password) async {
    final SharedPreferences saveToken = await SharedPreferences.getInstance();
    print('Masuk Remote Login');
    final Dio dio = new Dio();

    final response = await dio
        .post('https://forecast.sumantagroup.com/api/login-process', data: {
      'username': username,
      'password': password,
    });

    saveToken.setString('token', response.data['payload']['token']);
    print('Response Login: ${response.data}');
    print('Token :${response.data['payload']['token']}');
    print('Token : ${saveToken.getString('token')}');

    // await authenticationPreferences.saveToken(response.data['token']);

    return LoginModels.fromJson(response.data);

    // return LoginModels.fromJson(response);
  }
}
