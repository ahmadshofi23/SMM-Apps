import 'package:smm_apps/feature/product/data/dummy_data.dart';
import 'package:smm_apps/feature/product/domain/entity/product_entities.dart';
import 'package:smm_apps/feature/product/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Product>> getALlProduct() async {
    try {
      print('Masuk SIni');
      var listProduct = <Product>[];
      listProduct = product;
      return listProduct;
    } catch (e) {
      print('Masuk Sini');
      return [];
    }
  }
}
