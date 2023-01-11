import 'package:equatable/equatable.dart';

class AddToChartEntities extends Equatable {
  final String? status;
  final String? message;

  const AddToChartEntities({this.message, required this.status});

  @override
  List<Object?> get props => [status, message];
}

class Data extends Equatable {
  final int? id;
  final int? productInventoryId;
  final int? cartId;
  final int? forecastQty;
  final int? subtotal;
  final String? createdAt;
  final String? updatedAt;

  const Data(
      {this.id,
      this.productInventoryId,
      this.cartId,
      this.forecastQty,
      this.subtotal,
      this.createdAt,
      this.updatedAt});

  @override
  List<Object?> get props => [
        id,
        productInventoryId,
        cartId,
        forecastQty,
        subtotal,
        createdAt,
        updatedAt
      ];
}
