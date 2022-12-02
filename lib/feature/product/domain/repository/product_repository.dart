import 'package:smm_apps/feature/product/domain/entity/product_entities.dart';
import 'package:smm_apps/feature/product/domain/entity/product_respons_entity.dart';

abstract class ProductRepository {
  Future<List<Producttt>> getALlProduct();
  Future<ProductsResponseEntity> getALlProductResponse(int? pages);
  Future<ProductsResponseEntity> searchProductResponse(String keywords);
}
