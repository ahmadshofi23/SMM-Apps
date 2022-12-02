import 'package:equatable/equatable.dart';
import 'package:smm_apps/feature/product/data/models/product_models.dart';

class ProductsResponseEntity extends Equatable {
  final String? status;
  final String? message;
  final bool? showPaging;
  final List<ProductsEntity>? productsEntity;

  const ProductsResponseEntity({
    this.status,
    this.message,
    this.showPaging,
    this.productsEntity,
  });

  @override
  List<Object> get props => [status!, message!, showPaging!, productsEntity!];
}

class ProductsEntity extends Equatable {
  final int id;
  final int productId;
  final String code;
  final int quantity;
  final String batchNumber;
  final String expiredDate;
  final int createdUser;
  final String createdAt;
  final int editedUser;
  final String? editedAt;
  final int deletedUser;
  final String? deletedAt;
  final int price;
  final String imageSrc;
  final String name;
  final String unitName;
  final String priceLabel;
  final ProductEntity productEntity;

  const ProductsEntity(
      {required this.id,
      required this.productId,
      required this.code,
      required this.quantity,
      required this.batchNumber,
      required this.expiredDate,
      required this.createdUser,
      required this.createdAt,
      required this.editedUser,
      this.editedAt,
      required this.deletedUser,
      this.deletedAt,
      required this.price,
      required this.imageSrc,
      required this.name,
      required this.unitName,
      required this.priceLabel,
      required this.productEntity});
  @override
  List<Object?> get props => [
        id,
        productId,
        code,
        quantity,
        batchNumber,
        expiredDate,
        createdUser,
        createdAt,
        editedUser,
        editedAt,
        deletedUser,
        deletedAt,
        price,
        imageSrc,
        name,
        unitName,
        priceLabel,
        productEntity
      ];
}

class ProductEntity extends Equatable {
  final int id;
  final int vendorId;
  final int productCategorySubId;
  final int documentUploadId;
  final String code;
  final String name;
  final String description;
  final int createdUser;
  final String createdAt;
  final int editedUser;
  final String? editedAt;
  final int deletedUser;
  final String? deletedAt;
  final PictureEntity pictureEntity;

  const ProductEntity(
      {required this.id,
      required this.vendorId,
      required this.productCategorySubId,
      required this.documentUploadId,
      required this.code,
      required this.name,
      required this.description,
      required this.createdUser,
      required this.createdAt,
      required this.editedUser,
      this.editedAt,
      required this.deletedUser,
      this.deletedAt,
      required this.pictureEntity});

  @override
  List<Object?> get props => [
        id,
        vendorId,
        productCategorySubId,
        documentUploadId,
        code,
        name,
        description,
        createdUser,
        createdAt,
        editedUser,
        editedAt,
        deletedUser,
        deletedAt,
        pictureEntity
      ];
}

class PictureEntity extends Equatable {
  final int? id;
  final String? originalName;
  final String? encryptedName;
  final String? extensionName;
  final int? size;
  final String? mimeType;
  final String? path;
  final int? createdUser;
  final String? createdAt;

  const PictureEntity(
      {this.id,
      this.originalName,
      this.encryptedName,
      this.extensionName,
      this.size,
      this.mimeType,
      this.path,
      this.createdUser,
      this.createdAt});

  @override
  List<Object?> get props => [
        id,
        originalName,
        encryptedName,
        extensionName,
        size,
        mimeType,
        path,
        createdUser,
        createdAt
      ];
}
