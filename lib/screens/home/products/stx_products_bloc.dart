import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/repositories/product_repository.dart';

/// Generic types:
// T - data
// F - filter
// S - state
// E - extra

@Environment('hr')
@Environment('me')
@lazySingleton
class StxProductsBloc extends NetworkFilterableListBloc<

        /// Products is what we display in the list and work with.
        Product,

        /// Type of extra (List of categories, where category is a String)
        String,
        NetworkFilterableExtraListState<Product, String, List<String>>>
    with
        NetworkExtraBaseMixin<List<Product>, List<String>,
            NetworkFilterableExtraListState<Product, String, List<String>>> {
  StxProductsBloc(this.repository)
      : super(
          const NetworkFilterableExtraListState(
            data: [],

            /// [visibleData] is what is displayed on the screen.
            visibleData: [],

            /// [extraData] is categories on which we are filtering data.
            extraData: [],
          ),
        );

  final ProductRepository repository;

  /// Getting the list of products to display.
  @override
  Future<List<Product>> onLoadAsync() {
    return repository.getProducts();
  }

  /// Getting extras (i.e. categories in here).
  ///
  /// However, there is another bloc for getting them (StxCategoriesBloc).
  @override
  Future<List<String>> onLoadExtraAsync() {
    return repository.getCategories();
  }

  /// Is called before [state] is emitted.
  /// We can check the reason that caused the change of the data
  /// i.e. item added, removed, etc.
  @override
  NetworkFilterableExtraListState<Product, String, List<String>> onStateChanged(
    DataChangeReason reason,
    NetworkFilterableExtraListState<Product, String, List<String>> state,
  ) {
    var visibleData = state.data;

    if (state.query?.isNotEmpty ?? false) {
      visibleData = visibleData
          .where(
            (element) => element.title
                .toLowerCase()
                .contains(state.query!.toLowerCase()),
          )
          .toList();
    }

    if (state.filter != null) {
      visibleData = visibleData.where((e) {
        return e.category == state.filter;
      }).toList();
    }

    return state.copyWith(visibleData: visibleData);
  }

  @override
  bool equals(Product item1, Product item2) {
    return item1.id == item2.id;
  }
}
