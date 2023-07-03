import 'package:injectable/injectable.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/repositories/carts_repository.dart';

@lazySingleton
class CartsBloc extends NetworkFilterableListBloc<Cart, String,
        NetworkFilterableExtraListState<Cart, String, List<String>>>
    with
        NetworkExtraBaseMixin<List<Cart>, List<String>,
            NetworkFilterableExtraListState<Cart, String, List<String>>> {
  CartsBloc(this.repository)
      : super(
          const NetworkFilterableExtraListState(
            data: [],
            visibleData: [],
            extraData: [],
          ),
        );

  final CartsRepository repository;

  @override
  Future<List<Cart>> onLoadAsync() {
    return repository.getCarts();
  }

  @override
  bool equals(Cart item1, Cart item2) {
    return item1.id == item2.id;
  }
}
