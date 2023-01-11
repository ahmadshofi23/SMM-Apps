import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smm_apps/feature/product/domain/entity/product_entities.dart';
import 'package:smm_apps/feature/product/domain/entity/product_respons_entity.dart';
import 'package:smm_apps/feature/product/domain/entity/response_add_to_chart.dart';
import 'package:smm_apps/feature/product/domain/usecase/product_use_case.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUseCase useCase;

  ProductBloc({required this.useCase}) : super(const ProductState());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is GetAllProduct) {
      int pages = 0;
      yield state.copyWith(isLoading: true);

      yield state.copyWith(message: "Hallo");

      final response = await useCase.getAllProductResponse(pages);
      yield state.copyWith(
        listProductResponse: response.productsEntity,
        isLoading: false,
      );

      yield state.copyWith(message: "MEMEK");
    } else if (event is SearchProduct) {
      yield state.copyWith(
        isLoading: true,
      );
      Future.delayed(const Duration(seconds: 2));
      final response = await useCase.searchProductResponse(event.keySearch);
      yield state.copyWith(
        listProductResponse: response.productsEntity,
        isLoading: false,
      );
    } else if (event is LoadMoreProduct) {
      print('Masuk Block ini');
      List<ProductsEntity>? loadMore;
      final response = await useCase.getAllProductResponse(event.page);
      loadMore = state.listProductResponse;
      loadMore?.addAll(response.productsEntity as Iterable<ProductsEntity>);
      yield state.copyWith(isLoading: true);
      yield state.copyWith(listProductResponse: loadMore, isLoading: false);
      print('Length Product ${response.productsEntity?.length}');
    } else if (event is AddToChart) {
      yield state.copyWith(isLoading: true);
      final response =
          await useCase.addProductToChart(event.productId, event.qty);
      yield state.copyWith(
        responseAddToChart: response,
      );
      print('Response Add To Chart BLOC ${state.responseAddToChart?.status}');
      yield state.copyWith(isLoading: false);
    }
  }
}
