import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/repositories/carts_repository.dart';

@Environment('hr')
@Environment('me')
@lazySingleton
class CartsBloc extends NetworkFilterableListBloc<Cart, DateTimeRange?,
    NetworkFilterableState<List<Cart>, DateTimeRange?>> {
  final CartsRepository repository;

  CartsBloc(this.repository)
      : super(
          const NetworkFilterableState(
            data: [],
            visibleData: [],
          ),
        );

  @override
  Future<List<Cart>> onLoadAsync() {
    return repository.getCarts();
  }

  @override
  NetworkFilterableState<List<Cart>, DateTimeRange?> onStateChanged(
    DataChangeReason reason,
    NetworkFilterableState<List<Cart>, DateTimeRange?> state,
  ) {
    var visibleData = state.data;

    if (state.filter != null) {
      final startDate = state.filter?.start;
      final endDate = state.filter?.end;

      visibleData = visibleData.where(
        (element) {
          final isAfterStartDate =
              element.date?.isAfter(startDate ?? DateTime.now()) ?? false;
          final isBeforeEndDate =
              element.date?.isBefore(endDate ?? DateTime.now()) ?? false;

          return isAfterStartDate && isBeforeEndDate;
        },
      ).toList();
    }

    return state.copyWith(
      visibleData: visibleData,
    );
  }

  @override
  bool equals(Cart item1, Cart item2) {
    return item1.id == item2.id;
  }
}
