import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:smm_apps/feature/product/domain/entity/product_entities.dart';
import 'package:smm_apps/feature/product/domain/usecase/product_use_case.dart';
import 'dart:async';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUseCase useCase;

  ProductBloc({required this.useCase}) : super(const ProductState());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is GetAllProduct) {
      yield state.copyWith(isLoading: true);

      yield state.copyWith(message: "Hallo");

      final listProduct = await useCase.getAllProduct();

      yield state.copyWith(
        listProduct: listProduct,
        isLoading: false,
      );

      yield state.copyWith(message: "MEMEK");

      print('Product list ${listProduct.length}');

      print('state product baru :${state.listProduts}');
    } else {
      yield state.copyWith(
        isLoading: false,
      );
    }
  }
}
