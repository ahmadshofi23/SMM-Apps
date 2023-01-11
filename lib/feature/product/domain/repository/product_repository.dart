import 'package:smm_apps/feature/product/domain/entity/product_entities.dart';
import 'package:smm_apps/feature/product/domain/entity/product_respons_entity.dart';
import 'package:smm_apps/feature/product/domain/entity/response_add_to_chart.dart';

abstract class ProductRepository {
  Future<List<Producttt>> getALlProduct();
  Future<ProductsResponseEntity> getALlProductResponse(int? pages);
  Future<ProductsResponseEntity> searchProductResponse(String keywords);
  Future<AddToChartEntities> addProductToChart(int productId, String qty);
}
