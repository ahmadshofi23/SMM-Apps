part of 'forecast_bloc.dart';

class ForecastState extends Equatable {
  final List<ProductCart>? productCart;
  final bool? isLoading;

  const ForecastState({
    this.productCart = const [],
    this.isLoading,
  });

  ForecastState copyWith({
    List<ProductCart>? productCart,
    bool? isLoading,
  }) {
    return ForecastState(
      productCart: productCart ?? productCart,
      isLoading: isLoading ?? isLoading,
    );
  }

  @override
  List<Object?> get props => [productCart, isLoading];
}
