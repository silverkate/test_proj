part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    @Default(NetworkStatus.loading) NetworkStatus status,
    @Default([]) List<Product> products,
    @Default([]) List<String> categories,
    String? errorMessage,
  }) = _ProductsState;

  factory ProductsState.loadedProducts(
    List<Product> products,
  ) =>
      ProductsState(
        status: NetworkStatus.success,
        products: products,
      );

  factory ProductsState.loadedCategories(
    List<String> categories,
  ) =>
      ProductsState(
        status: NetworkStatus.success,
        categories: categories,
      );
}
