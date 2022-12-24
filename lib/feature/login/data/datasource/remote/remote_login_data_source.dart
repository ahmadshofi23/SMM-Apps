import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smm_apps/feature/login/data/datasource/local/authentication_preferences.dart';
import 'package:smm_apps/feature/login/data/models/login_models.dart';
import 'package:http/http.dart' as http;

abstract class RemoteLoginDataSource {
  Future<LoginModels?> login(String username, String password);
}

class RemoteLoginDataSourceImpl extends RemoteLoginDataSource {
  RemoteLoginDataSourceImpl();

  @override
  Future<LoginModels?> login(String username, String password) async {
    final SharedPreferences saveToken = await SharedPreferences.getInstance();
    final SharedPreferences saveUser = await SharedPreferences.getInstance();
    print('Masuk Remote Login');
    final Dio dio = new Dio();

    try {
      final response = await dio
          .post('https://forecast.sumantagroup.com/api/login-process', data: {
        'username': username,
        'password': password,
      });

      Map<String, dynamic> dataUser = {
        "id": response.data['payload']['user']['id'],
        "name": response.data['payload']['user']['name'],
        "email": response.data['payload']['user']['email'],
        "username": response.data['payload']['user']['username'],
        "address": response.data['payload']['user']['address'],
        "phone": response.data['payload']['user']['phone'],
        "image_src": response.data['payload']['user']['image_src'],
      };

      String encodeDataUser = json.encode(dataUser);
      saveUser.setString('user', encodeDataUser);

      saveToken.setString('token', response.data['payload']['token']);

      print('Ini response dari server$response');

      return LoginModels.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        print('Username atau Password Salah');
      } else {
        throw Exception('Gagal Login');
      }
    }

    // return LoginModels.fromJson(response);
  }
}
