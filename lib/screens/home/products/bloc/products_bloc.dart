import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/repositories/product_repository.dart';

part 'products_bloc.freezed.dart';
part 'products_event.dart';
part 'products_state.dart';

@Environment('hr')
@Environment('me')
@lazySingleton
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository repository;

  ProductsBloc({
    required this.repository,
  }) : super(const ProductsState()) {
    on<_LoadProducts>(_loadProducts);
    on<_Search>(_search);
  }

  FutureOr<void> _loadProducts(
    _LoadProducts event,
    Emitter<ProductsState> emit,
  ) async {
    emit(state.copyWith(status: NetworkStatus.loading));

    try {
      final products = await repository.getProducts();

      emit(ProductsState.loadedProducts(products));
    } catch (_) {
      emit(state.copyWith(status: NetworkStatus.failure));
    }
  }

  FutureOr<void> _search(_Search event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(status: NetworkStatus.loading));

    try {
      final products = await repository.search(event.query);

      emit(ProductsState.loadedProducts(products));
    } catch (_) {
      emit(state.copyWith(status: NetworkStatus.failure));
    }
  }
}
