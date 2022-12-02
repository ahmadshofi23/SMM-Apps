class ProductsModels {
  String? status;
  String? message;
  bool? showPaging;
  List<DataProduct>? dataProduct;

  ProductsModels(
      {this.status, this.message, this.showPaging, this.dataProduct});

  ProductsModels.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    showPaging = json['show_paging'];
    if (json['payload'] != null) {
      dataProduct = <DataProduct>[];
      json['payload'].forEach((v) {
        dataProduct!.add(DataProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['show_paging'] = showPaging;
    if (dataProduct != null) {
      data['payload'] = dataProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataProduct {
  int? id;
  int? productId;
  String? code;
  int? quantity;
  String? batchNumber;
  String? expiredDate;
  int? createdUser;
  String? createdAt;
  int? editedUser;
  String? editedAt;
  int? deletedUser;
  String? deletedAt;
  int? price;
  String? imageSrc;
  String? name;
  String? unitName;
  String? priceLabel;
  Product? product;

  DataProduct(
      {this.id,
      this.productId,
      this.code,
      this.quantity,
      this.batchNumber,
      this.expiredDate,
      this.createdUser,
      this.createdAt,
      this.editedUser,
      this.editedAt,
      this.deletedUser,
      this.deletedAt,
      this.price,
      this.imageSrc,
      this.name,
      this.unitName,
      this.priceLabel,
      this.product});

  DataProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    code = json['code'];
    quantity = json['quantity'];
    batchNumber = json['batch_number'];
    expiredDate = json['expired_date'];
    createdUser = json['created_user'];
    createdAt = json['created_at'];
    editedUser = json['edited_user'];
    editedAt = json['edited_at'];
    deletedUser = json['deleted_user'];
    deletedAt = json['deleted_at'];
    price = json['price'];
    imageSrc = json['image_src'];
    name = json['name'];
    unitName = json['unit_name'];
    priceLabel = json['price_label'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['code'] = code;
    data['quantity'] = quantity;
    data['batch_number'] = batchNumber;
    data['expired_date'] = expiredDate;
    data['created_user'] = createdUser;
    data['created_at'] = createdAt;
    data['edited_user'] = editedUser;
    data['edited_at'] = editedAt;
    data['deleted_user'] = deletedUser;
    data['deleted_at'] = deletedAt;
    data['price'] = price;
    data['image_src'] = imageSrc;
    data['name'] = name;
    data['unit_name'] = unitName;
    data['price_label'] = priceLabel;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  int? vendorId;
  int? productCategorySubId;
  int? documentUploadId;
  String? code;
  String? name;
  String? description;
  int? createdUser;
  String? createdAt;
  int? editedUser;
  String? editedAt;
  int? deletedUser;
  String? deletedAt;
  Picture? picture;

  Product(
      {this.id,
      this.vendorId,
      this.productCategorySubId,
      this.documentUploadId,
      this.code,
      this.name,
      this.description,
      this.createdUser,
      this.createdAt,
      this.editedUser,
      this.editedAt,
      this.deletedUser,
      this.deletedAt,
      this.picture});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    productCategorySubId = json['product_category_sub_id'];
    documentUploadId = json['document_upload_id'];
    code = json['code'];
    name = json['name'];
    description = json['description'];
    createdUser = json['created_user'];
    createdAt = json['created_at'];
    editedUser = json['edited_user'];
    editedAt = json['edited_at'];
    deletedUser = json['deleted_user'];
    deletedAt = json['deleted_at'];
    picture =
        json['picture'] != null ? new Picture.fromJson(json['picture']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor_id'] = this.vendorId;
    data['product_category_sub_id'] = this.productCategorySubId;
    data['document_upload_id'] = this.documentUploadId;
    data['code'] = this.code;
    data['name'] = this.name;
    data['description'] = this.description;
    data['created_user'] = this.createdUser;
    data['created_at'] = this.createdAt;
    data['edited_user'] = this.editedUser;
    data['edited_at'] = this.editedAt;
    data['deleted_user'] = this.deletedUser;
    data['deleted_at'] = this.deletedAt;
    if (this.picture != null) {
      data['picture'] = this.picture!.toJson();
    }
    return data;
  }
}

class Picture {
  int? id;
  String? originalName;
  String? encryptedName;
  String? extension;
  int? size;
  String? mimeType;
  String? path;
  int? createdUser;
  String? createdAt;

  Picture(
      {this.id,
      this.originalName,
      this.encryptedName,
      this.extension,
      this.size,
      this.mimeType,
      this.path,
      this.createdUser,
      this.createdAt});

  Picture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    originalName = json['original_name'];
    encryptedName = json['encrypted_name'];
    extension = json['extension'];
    size = json['size'];
    mimeType = json['mime_type'];
    path = json['path'];
    createdUser = json['created_user'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['original_name'] = this.originalName;
    data['encrypted_name'] = this.encryptedName;
    data['extension'] = this.extension;
    data['size'] = this.size;
    data['mime_type'] = this.mimeType;
    data['path'] = this.path;
    data['created_user'] = this.createdUser;
    data['created_at'] = this.createdAt;
    return data;
  }
}
