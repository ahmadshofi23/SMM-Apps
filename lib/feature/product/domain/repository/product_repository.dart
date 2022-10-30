import 'package:smm_apps/feature/product/domain/entity/product_entities.dart';

abstract class ProductRepository {
  Future<List<Product>> getALlProduct();
}
