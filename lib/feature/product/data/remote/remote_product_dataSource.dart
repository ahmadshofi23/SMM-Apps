import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smm_apps/feature/product/data/models/product_models.dart';

abstract class RemoteProductDataSource {
  Future<ProductsModels> getAllProductResponse(int? page);
  Future<ProductsModels> searchProductResponse(String keywords);
}

class RemoteProductDataSourceImpl extends RemoteProductDataSource {
  RemoteProductDataSourceImpl();

  @override
  Future<ProductsModels> getAllProductResponse(int? page) async {
    final SharedPreferences saveToken = await SharedPreferences.getInstance();
    String token = saveToken.getString('token')!;
    print('Masuk Remote Product');
    final Dio dio = new Dio();
    final response = await dio.get(
        'https://forecast.sumantagroup.com/api/user/product-list?page=$page',
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));

    print('Response Product: ${response.data}');

    return ProductsModels.fromJson(response.data);
  }

  @override
  Future<ProductsModels> searchProductResponse(String keywords) async {
    final SharedPreferences saveToken = await SharedPreferences.getInstance();
    String token = saveToken.getString('token')!;
    print('Masuk Remote Product');
    final Dio dio = new Dio();
    final response = await dio.get(
        'https://forecast.sumantagroup.com/api/user/product-list?keywords=$keywords',
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));

    print('Response Product: ${response.data}');

    return ProductsModels.fromJson(response.data);
  }
}
