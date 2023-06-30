import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/repositories/product_repository.dart';

part 'products_bloc.freezed.dart';
part 'products_event.dart';
part 'products_state.dart';

@lazySingleton
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({
    required this.repository,
  }) : super(const ProductsState()) {
    on<_Load>(_load);
  }

  final ProductRepository repository;

  FutureOr<void> _load(_Load event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(status: NetworkStatus.loading));

    try {
      final chats = await repository.getProducts();

      emit(ProductsState.success(chats));
    } catch (_) {
      emit(state.copyWith(status: NetworkStatus.failure));
    }
  }
}