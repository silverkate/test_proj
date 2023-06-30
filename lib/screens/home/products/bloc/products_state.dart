part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    @Default(NetworkStatus.loading) NetworkStatus status,
    @Default([]) List<Product> products,
    String? errorMessage,
  }) = _ProductsState;

  factory ProductsState.success(List<Product> products) => ProductsState(
        status: NetworkStatus.success,
        products: products,
      );
}
