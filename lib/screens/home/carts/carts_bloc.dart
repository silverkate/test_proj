import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/repositories/carts_repository.dart';

@lazySingleton
class CartsBloc extends NetworkFilterableListBloc<Cart, DateTimeRange?,
    NetworkFilterableState<List<Cart>, DateTimeRange?>> {
  CartsBloc(this.repository)
      : super(
          const NetworkFilterableState(
            data: [],
            visibleData: [],
          ),
        );

  final CartsRepository repository;
  List<Cart> _carts = [];

  @override
  Future<List<Cart>> onLoadAsync() {
    return repository.getCarts();
  }

  @override
  NetworkFilterableState<List<Cart>, DateTimeRange?> onStateChanged(
    DataChangeReason reason,
    NetworkFilterableState<List<Cart>, DateTimeRange?> state,
  ) {
    if (reason.isLoaded) {
      _carts = state.data;
    } else if (reason.isFiltered) {
      final startDate = state.filter?.start;
      final endDate = state.filter?.end;

      return state.copyWith(
        data: _carts.where(
          (element) {
            final isAfterStartDate =
                element.date?.isAfter(startDate ?? DateTime.now()) ?? false;
            final isBeforeEndDate =
                element.date?.isBefore(endDate ?? DateTime.now()) ?? false;

            return isAfterStartDate && isBeforeEndDate;
          },
        ).toList(),
      );
    }

    return super.onStateChanged(reason, state);
  }

  @override
  bool equals(Cart item1, Cart item2) {
    return item1.id == item2.id;
  }
}
