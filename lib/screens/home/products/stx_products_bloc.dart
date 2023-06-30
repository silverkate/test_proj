import 'package:injectable/injectable.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/repositories/product_repository.dart';

//
// list bloc -> search bloc -> filterable bloc (firstly hardcode categories)

@lazySingleton
class StxProductsBloc
    extends NetworkListBloc<Product, NetworkListState<Product>> {
  StxProductsBloc(this.repository) : super(const NetworkListState(data: []));

  final ProductRepository repository;

  @override
  bool equals(Product item1, Product item2) {
    return item1.title == item2.title;
  }

  @override
  Future<List<Product>> onLoadAsync() {
    return repository.getProducts();
  }
}
