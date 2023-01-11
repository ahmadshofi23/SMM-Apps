class ChartModels {
  String? status;
  String? message;
  List<Data>? data;

  ChartModels({this.status, this.message, this.data});

  ChartModels.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? productInventoryId;
  int? cartId;
  int? forecastQty;
  int? subtotal;
  String? createdAt;
  String? updatedAt;
  ProductDetail? productDetail;

  Data(
      {this.id,
      this.productInventoryId,
      this.cartId,
      this.forecastQty,
      this.subtotal,
      this.createdAt,
      this.updatedAt,
      this.productDetail});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productInventoryId = json['product_inventory_id'];
    cartId = json['cart_id'];
    forecastQty = json['forecast_qty'];
    subtotal = json['subtotal'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productDetail = json['product_detail'] != null
        ? new ProductDetail.fromJson(json['product_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_inventory_id'] = this.productInventoryId;
    data['cart_id'] = this.cartId;
    data['forecast_qty'] = this.forecastQty;
    data['subtotal'] = this.subtotal;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.productDetail != null) {
      data['product_detail'] = this.productDetail!.toJson();
    }
    return data;
  }
}

class ProductDetail {
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
  Null? deletedAt;
  String? imageSrc;

  ProductDetail(
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
      this.imageSrc});

  ProductDetail.fromJson(Map<String, dynamic> json) {
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
    imageSrc = json['image_src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['code'] = this.code;
    data['quantity'] = this.quantity;
    data['batch_number'] = this.batchNumber;
    data['expired_date'] = this.expiredDate;
    data['created_user'] = this.createdUser;
    data['created_at'] = this.createdAt;
    data['edited_user'] = this.editedUser;
    data['edited_at'] = this.editedAt;
    data['deleted_user'] = this.deletedUser;
    data['deleted_at'] = this.deletedAt;
    data['image_src'] = this.imageSrc;
    return data;
  }
}
