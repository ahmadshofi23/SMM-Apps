class AddToChartModels {
  String? status;
  String? message;
  Data? data;

  AddToChartModels({this.status, this.message, this.data});

  AddToChartModels.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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

  Data(
      {this.id,
      this.productInventoryId,
      this.cartId,
      this.forecastQty,
      this.subtotal,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productInventoryId = json['product_inventory_id'];
    cartId = json['cart_id'];
    forecastQty = json['forecast_qty'];
    subtotal = json['subtotal'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}
