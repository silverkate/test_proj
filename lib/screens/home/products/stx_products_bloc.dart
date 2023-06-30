import 'package:injectable/injectable.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/repositories/product_repository.dart';

//
// list bloc -> search bloc -> filterable bloc (firstly hardcode categories)

@lazySingleton
class StxProductsBloc extends NetworkSearchableListBloc<Product,
    NetworkSearchableListState<Product>> {
  StxProductsBloc(this.repository)
      : super(
          const NetworkSearchableListState(
            data: [],
            visibleData: [],
          ),
        );

  final ProductRepository repository;

  @override
  bool equals(Product item1, Product item2) {
    return item1.title == item2.title;
  }

  @override
  Future<List<Product>> onLoadAsync() {
    return repository.getProducts();
  }

  @override
  Future<List<Product>> onSearchAsync(String query) {
    return repository.search(query);
  }
}
