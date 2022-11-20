import 'package:dio/dio.dart';
import 'package:smm_apps/feature/login/data/models/login_models.dart';
import 'package:http/http.dart' as http;

abstract class RemoteLoginDataSource {
  Future<LoginModels> login(String username, String password);
}

class RemoteLoginDataSourceImpl extends RemoteLoginDataSource {
  RemoteLoginDataSourceImpl();

  @override
  Future<LoginModels> login(String username, String password) async {
    print('Masuk Remote Login');
    final Dio dio = new Dio();

    final response = await dio
        .post('https://forecast.sumantagroup.com/api/login-process', data: {
      'username': username,
      'password': password,
    });

    print(response.data);

    return LoginModels.fromJson(response.data);

    // return LoginModels.fromJson(response);
  }
}
