import 'package:smm_apps/feature/forecast/domain/entity/product_cart_entity.dart';
import 'package:smm_apps/feature/forecast/domain/repository/forecast_repository.dart';

class ForeCastRepositoryImpl implements ForecastRepository {
  final List<ProductCart> listChartProduct = [];
  @override
  Future<void> addToCart(ProductCart productCart) async {
    // listChartProduct.add(productCart);
    for (var item in listChartProduct) {
      print(item);
    }

    // listChartProduct.add(productCart);
    print('Product $productCart');
    print('Product Cart ${productCart.name}');
    print('Length Product Cart ${listChartProduct.length}');
    return listChartProduct.add(productCart);
  }

  @override
  Future<List<ProductCart>> getAllProductChart() async {
    print('Length list Product Cart $listChartProduct');
    return listChartProduct;
  }
}
