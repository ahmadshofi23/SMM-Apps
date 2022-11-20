part of 'forecast_bloc.dart';

@immutable
abstract class ForecastEvent extends Equatable {
  const ForecastEvent();
}

class AddToChart extends ForecastEvent {
  final ProductCart productCart;
  const AddToChart({required this.productCart});

  @override
  List<Object> get props => [productCart];
}

class GetAllChart extends ForecastEvent {
  @override
  List<Object?> get props => [];
}
