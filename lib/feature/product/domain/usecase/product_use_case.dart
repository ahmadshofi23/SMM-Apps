import 'package:smm_apps/feature/product/domain/repository/product_repository.dart';
import 'package:smm_apps/feature/product/domain/entity/product_entities.dart';

abstract class ProductUseCase {
  Future<List<Product>> getAllProduct();
}

class ProductUseCaseImpl implements ProductUseCase {
  final ProductRepository productRepository;

  ProductUseCaseImpl({required this.productRepository});

  @override
  Future<List<Product>> getAllProduct() => productRepository.getALlProduct();
}
