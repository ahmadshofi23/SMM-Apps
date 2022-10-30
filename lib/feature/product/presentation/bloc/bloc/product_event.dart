part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetAllProduct extends ProductEvent {
  @override
  List<Object> get props => [];
}
