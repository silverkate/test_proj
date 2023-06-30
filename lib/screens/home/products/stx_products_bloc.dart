import 'package:injectable/injectable.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/repositories/product_repository.dart';

/// String -> category
@lazySingleton
class StxProductsBloc extends NetworkFilterableListBloc<
        Product,
        String,
//
// T - data
// F - filter
// S - state
// E - extra
        NetworkFilterableExtraListState<Product, String, List<String>>>
    with
        NetworkExtraBaseMixin<List<Product>, List<String>,
            NetworkFilterableExtraListState<Product, String, List<String>>> {
  StxProductsBloc(this.repository)
      : super(
          const NetworkFilterableExtraListState(
            data: [],

            /// [visibleData] is what is displayed on the screen
            visibleData: [],

            /// [extraData] is categories по яким ми фільтруємо
            extraData: [],
          ),
        );

  final ProductRepository repository;

  List<Product> _data = [];

  @override
  Future<List<Product>> onLoadAsync() {
    return repository.getProducts();
  }

  /// getting extra (categories)
  @override
  Future<List<String>> onLoadExtraAsync() {
    return repository.getCategories();
  }

  /// both data and extra
  @override
  void loadWithExtra() {
    super.loadWithExtra();
  }

  /// Is called before [state] is emitted.
  /// We can check the reason that caused the change of the data
  /// i.e. item added, removed, etc.
  @override
  NetworkFilterableExtraListState<Product, String, List<String>> onStateChanged(
    DataChangeReason reason,
    NetworkFilterableExtraListState<Product, String, List<String>> state,
  ) {
    if (reason.isLoaded) {
      _data = state.data;
    } else if (reason.isSearched) {
      final search = state.query ?? '';

      final filteredProducts = _data
          .where(
            (element) =>
                element.title?.toLowerCase().contains(search.toLowerCase()) ??
                false,
          )
          .toList();

      return NetworkFilterableExtraListState(
        data: filteredProducts,
        visibleData: filteredProducts,
        extraData: const [],
        status: NetworkStatus.success,
      );
    } else if (reason.isFiltered) {
      final category = state.filter;

      final filteredProducts = _data.where((e) {
        return e.category == category;
      }).toList();

      return NetworkFilterableExtraListState(
        data: filteredProducts,
        visibleData: filteredProducts,
        extraData: const [],
        status: NetworkStatus.success,
      );
    }

    return super.onStateChanged(reason, state);
  }

  @override
  bool equals(Product item1, Product item2) {
    return item1.title == item2.title;
  }
}
