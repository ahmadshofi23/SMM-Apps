import 'package:smm_apps/feature/forecast/domain/entity/product_cart_entity.dart';

abstract class ForecastRepository {
  Future<void> addToCart(ProductCart productCart);
  Future<List<ProductCart>> getAllProductChart();
}
