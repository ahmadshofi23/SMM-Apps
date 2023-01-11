import 'package:smm_apps/feature/product/domain/entity/product_respons_entity.dart';
import 'package:smm_apps/feature/product/domain/entity/response_add_to_chart.dart';
import 'package:smm_apps/feature/product/domain/repository/product_repository.dart';
import 'package:smm_apps/feature/product/domain/entity/product_entities.dart';

abstract class ProductUseCase {
  Future<List<Producttt>> getAllProduct();
  Future<ProductsResponseEntity> getAllProductResponse(
    int? pages,
  );
  Future<ProductsResponseEntity> searchProductResponse(String keywords);
  Future<AddToChartEntities> addProductToChart(int productId);
}

class ProductUseCaseImpl implements ProductUseCase {
  final ProductRepository productRepository;

  ProductUseCaseImpl({required this.productRepository});

  @override
  Future<List<Producttt>> getAllProduct() => productRepository.getALlProduct();

  @override
  Future<ProductsResponseEntity> getAllProductResponse(int? pages) {
    return productRepository.getALlProductResponse(pages);
  }

  @override
  Future<ProductsResponseEntity> searchProductResponse(String keywords) {
    return productRepository.searchProductResponse(keywords);
  }

  @override
  Future<AddToChartEntities> addProductToChart(int productId) {
    return productRepository.addProductToChart(productId);
  }
}
