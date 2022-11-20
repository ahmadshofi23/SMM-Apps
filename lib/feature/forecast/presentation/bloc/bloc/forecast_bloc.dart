import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:smm_apps/feature/forecast/domain/entity/product_cart_entity.dart';
import 'package:smm_apps/feature/forecast/domain/usecase/forecast_usecase.dart';
import 'dart:async';

part 'forecast_event.dart';
part 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final ForecastUseCase useCase;
  ForecastBloc({required this.useCase}) : super(const ForecastState());

  @override
  Stream<ForecastState> mapEventToState(ForecastEvent event) async* {
    if (event is AddToChart) {
      // yield state.copyWith(isLoading: true);
      print('Masuk Forecast Bloc');
      useCase.addToChart(event.productCart);
    } else if (event is GetAllChart) {
      yield state.copyWith(
        isLoading: true,
      );
      final response = await useCase.getAllProductChart();
      print('Response Data ${response.length}');
      yield state.copyWith(
        productCart: response,
        isLoading: false,
      );
    }
    {
      // yield state.copyWith(
      //   isLoading: false,
      // );
    }
  }
}
