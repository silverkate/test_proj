part of 'products_bloc.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.loadProducts() = _LoadProducts;
  const factory ProductsEvent.search(String query) = _Search;
}
