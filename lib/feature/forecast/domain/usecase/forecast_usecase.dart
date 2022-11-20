import 'package:smm_apps/feature/forecast/domain/entity/product_cart_entity.dart';
import 'package:smm_apps/feature/forecast/domain/repository/forecast_repository.dart';

abstract class ForecastUseCase {
  void addToChart(ProductCart productCart);
  Future<List<ProductCart>> getAllProductChart();
}

class ForeCastUseCaseImpl implements ForecastUseCase {
  final ForecastRepository forecastRepository;

  ForeCastUseCaseImpl({required this.forecastRepository});

  @override
  Future<List<ProductCart>> getAllProductChart() {
    return forecastRepository.getAllProductChart();
  }

  @override
  Future<void> addToChart(ProductCart productCart) {
    return forecastRepository.addToCart(productCart);
  }
}
