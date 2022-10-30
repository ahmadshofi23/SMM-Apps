part of 'product_bloc.dart';

class ProductState extends Equatable {
  final bool? isLoading;
  final List<Product>? listProduts;
  final String? message;

  const ProductState({
    this.isLoading = true,
    this.listProduts = const [],
    this.message,
  });

  ProductState copyWith({
    List<Product>? listProduct,
    bool? isLoading,
    String? message,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      listProduts: listProduct ?? listProduts,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        listProduts,
        message,
      ];
}
