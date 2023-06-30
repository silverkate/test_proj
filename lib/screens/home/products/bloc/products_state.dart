part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    @Default(NetworkStatus.loading) NetworkStatus status,
    @Default([]) List<Product> products,
    @Default([]) List<String> categories,
    String? errorMessage,
  }) = _ProductsState;

  factory ProductsState.success(
    List<Product> products,
    List<String> categories,
  ) =>
      ProductsState(
        status: NetworkStatus.success,
        products: products,
        categories: categories,
      );
}
