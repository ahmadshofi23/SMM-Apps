// import 'package:flutter_modular/flutter_modular.dart';
import 'package:smm_apps/feature/product/data/dummy_data.dart';
import 'package:smm_apps/feature/product/data/remote/remote_product_dataSource.dart';
import 'package:smm_apps/feature/product/domain/entity/product_entities.dart';
import 'package:smm_apps/feature/product/domain/entity/product_respons_entity.dart';
import 'package:smm_apps/feature/product/domain/entity/response_add_to_chart.dart';
import 'package:smm_apps/feature/product/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteProductDataSource remoteProductDataSource;

  ProductRepositoryImpl({required this.remoteProductDataSource});

  @override
  Future<List<Producttt>> getALlProduct() async {
    try {
      print('Masuk SIni');
      var listProduct = <Producttt>[];
      listProduct = product;
      return listProduct;
    } catch (e) {
      print('Masuk Sini');
      return [];
    }
  }

  @override
  Future<ProductsResponseEntity> getALlProductResponse(int? page) async {
    final response = await remoteProductDataSource.getAllProductResponse(page!);
    print('Response Di Remote : ${response.dataProduct}');
    if (response.dataProduct != null) {
      final dataProduct = <ProductsEntity>[];
      response.dataProduct?.forEach((element) {
        dataProduct.add(ProductsEntity(
            priceLabel: element.priceLabel!,
            name: element.name!,
            code: element.code!,
            productId: element.productId!,
            id: element.id!,
            quantity: element.quantity!,
            batchNumber: element.batchNumber!,
            expiredDate: element.expiredDate!,
            createdUser: element.createdUser!,
            createdAt: element.createdAt!,
            editedUser: element.editedUser!,
            editedAt: element.editedAt,
            deletedUser: element.deletedUser!,
            deletedAt: element.deletedAt,
            price: element.price!,
            imageSrc: element.imageSrc!,
            unitName: element.unitName!,
            productEntity: ProductEntity(
                id: element.product!.id!,
                vendorId: element.product!.vendorId!,
                productCategorySubId: element.product!.productCategorySubId!,
                documentUploadId: element.product!.documentUploadId!,
                code: element.product!.code!,
                name: element.product!.name!,
                description: element.product!.description!,
                createdUser: element.product!.createdUser!,
                createdAt: element.product!.createdAt!,
                editedUser: element.product!.editedUser!,
                editedAt: element.product?.editedAt,
                deletedUser: element.product!.deletedUser!,
                deletedAt: element.product?.deletedAt,
                pictureEntity: PictureEntity(
                  id: element.product?.picture?.id,
                  originalName: element.product?.picture?.originalName,
                  encryptedName: element.product?.picture?.encryptedName,
                  extensionName: element.product?.picture?.encryptedName,
                  size: element.product?.picture?.size,
                  mimeType: element.product?.picture?.mimeType,
                  path: element.product?.picture?.path,
                  createdUser: element.product?.picture?.createdUser,
                  createdAt: element.product?.picture?.createdAt,
                ))));
      });

      return ProductsResponseEntity(
          status: response.status!,
          message: response.message!,
          showPaging: response.showPaging!,
          productsEntity: dataProduct);
    } else {
      return ProductsResponseEntity(
          status: response.status,
          message: response.message,
          showPaging: response.showPaging,
          productsEntity: []);
    }
  }

  @override
  Future<ProductsResponseEntity> searchProductResponse(String keywords) async {
    final response =
        await remoteProductDataSource.searchProductResponse(keywords);
    print('Response Di Remote : ${response.dataProduct}');
    if (response.dataProduct != null) {
      final dataProduct = <ProductsEntity>[];
      response.dataProduct?.forEach((element) {
        dataProduct.add(ProductsEntity(
            priceLabel: element.priceLabel!,
            name: element.name!,
            code: element.code!,
            productId: element.productId!,
            id: element.id!,
            quantity: element.quantity!,
            batchNumber: element.batchNumber!,
            expiredDate: element.expiredDate!,
            createdUser: element.createdUser!,
            createdAt: element.createdAt!,
            editedUser: element.editedUser!,
            editedAt: element.editedAt,
            deletedUser: element.deletedUser!,
            deletedAt: element.deletedAt,
            price: element.price!,
            imageSrc: element.imageSrc!,
            unitName: element.unitName!,
            productEntity: ProductEntity(
                id: element.product!.id!,
                vendorId: element.product!.vendorId!,
                productCategorySubId: element.product!.productCategorySubId!,
                documentUploadId: element.product!.documentUploadId!,
                code: element.product!.code!,
                name: element.product!.name!,
                description: element.product!.description!,
                createdUser: element.product!.createdUser!,
                createdAt: element.product!.createdAt!,
                editedUser: element.product!.editedUser!,
                editedAt: element.product?.editedAt,
                deletedUser: element.product!.deletedUser!,
                deletedAt: element.product?.deletedAt,
                pictureEntity: PictureEntity(
                  id: element.product?.picture?.id,
                  originalName: element.product?.picture?.originalName,
                  encryptedName: element.product?.picture?.encryptedName,
                  extensionName: element.product?.picture?.encryptedName,
                  size: element.product?.picture?.size,
                  mimeType: element.product?.picture?.mimeType,
                  path: element.product?.picture?.path,
                  createdUser: element.product?.picture?.createdUser,
                  createdAt: element.product?.picture?.createdAt,
                ))));
      });

      return ProductsResponseEntity(
          status: response.status!,
          message: response.message!,
          showPaging: response.showPaging!,
          productsEntity: dataProduct);
    } else {
      return ProductsResponseEntity(
          status: response.status,
          message: response.message,
          showPaging: response.showPaging,
          productsEntity: []);
    }
  }

  @override
  Future<AddToChartEntities> addProductToChart(
      int productId, String qty) async {
    final response =
        await remoteProductDataSource.addProductToChart(productId, qty);
    return AddToChartEntities(
      status: response.status,
      message: response.message,
    );
  }
}
