import 'package:injectable/injectable.dart';
import 'package:test_proj/core/extensions/index.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/repositories/carts_repository.dart';

@lazySingleton
class CartsBloc extends NetworkFilterableListBloc<Cart, DateTime,
    NetworkFilterableState<List<Cart>, DateTime>> {
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
  NetworkFilterableState<List<Cart>, DateTime> onStateChanged(
    DataChangeReason reason,
    NetworkFilterableState<List<Cart>, DateTime> state,
  ) {
    if (reason.isLoaded) {
      _carts = state.data;
    } else if (reason.isFiltered) {
      return state.copyWith(
        data: _carts
            .where(
              (element) =>
                  element.date?.isTheSameDate(state.filter ?? DateTime.now()) ??
                  false,
            )
            .toList(),
      );
    }

    return super.onStateChanged(reason, state);
  }

  @override
  bool equals(Cart item1, Cart item2) {
    return item1.id == item2.id;
  }
}
