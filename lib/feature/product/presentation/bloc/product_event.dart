part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetAllProduct extends ProductEvent {
  @override
  List<Object> get props => [];
}

class SearchProduct extends ProductEvent {
  final String keySearch;

  const SearchProduct({required this.keySearch});

  @override
  List<Object?> get props => [keySearch];
}

class LoadMoreProduct extends ProductEvent {
  final int page;

  const LoadMoreProduct({required this.page});

  @override
  List<Object?> get props => [page];
}
