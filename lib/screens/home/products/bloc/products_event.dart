part of 'products_bloc.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.load() = _Load;
  const factory ProductsEvent.search(String query) = _Search;
}
