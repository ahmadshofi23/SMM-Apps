part of 'product_bloc.dart';

class ProductState extends Equatable {
  final bool? isLoading;
  final List<Producttt>? listProduts;
  final String? message;
  final List<ProductsEntity>? listProductResponse;
  final AddToChartEntities? responseAddToChart;

  const ProductState(
      {this.isLoading = true,
      this.listProduts = const [],
      this.message,
      this.listProductResponse = const [],
      this.responseAddToChart});

  ProductState copyWith({
    List<Producttt>? listProduct,
    bool? isLoading,
    String? message,
    AddToChartEntities? responseAddToChart,
    List<ProductsEntity>? listProductResponse,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      listProduts: listProduct ?? listProduts,
      message: message ?? this.message,
      listProductResponse: listProductResponse ?? this.listProductResponse,
      responseAddToChart: responseAddToChart ?? this.responseAddToChart,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        listProduts,
        message,
        listProductResponse,
      ];
}
