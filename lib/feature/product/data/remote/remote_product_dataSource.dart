import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smm_apps/feature/product/data/models/add_to_chart_models.dart';
import 'package:smm_apps/feature/product/data/models/product_models.dart';

abstract class RemoteProductDataSource {
  Future<ProductsModels> getAllProductResponse(int? page);
  Future<ProductsModels> searchProductResponse(String keywords);
  Future<AddToChartModels> addProductToChart(int productId);
}

class RemoteProductDataSourceImpl extends RemoteProductDataSource {
  RemoteProductDataSourceImpl();
  String baseUrl = 'https://forecast.sumantagroup.com/api/user';

  @override
  Future<ProductsModels> getAllProductResponse(int? page) async {
    final SharedPreferences saveToken = await SharedPreferences.getInstance();
    String token = saveToken.getString('token')!;
    print('Masuk Remote Product');
    final Dio dio = new Dio();
    final response = await dio.get('$baseUrl/product-list?page=$page',
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
    final response = await dio.get('$baseUrl/product-list?keywords=$keywords',
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));

    print('Response Product: ${response.data}');

    return ProductsModels.fromJson(response.data);
  }

  @override
  Future<AddToChartModels> addProductToChart(int productId) async {
    final SharedPreferences saveToken = await SharedPreferences.getInstance();
    String token = saveToken.getString('token')!;
    print('Masuk Remote Add Prodcut');
    final Dio dio = Dio();
    final response = await dio.post('$baseUrl/add-product-to-cart',
        data: {'product_inventory_id': productId},
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
    print('Response Add Chart $response');
    return AddToChartModels.fromJson(response.data);
  }
}
