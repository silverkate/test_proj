import 'package:injectable/injectable.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/repositories/product_repository.dart';

@lazySingleton
class StxCategoriesBloc
    extends NetworkListBloc<String, NetworkListState<String>> {
  StxCategoriesBloc(this.repository)
      : super(
          const NetworkListState(data: []),
        );
  final ProductRepository repository;

  @override
  bool equals(String item1, String item2) {
    return item1 == item2;
  }

  @override
  Future<List<String>> onLoadAsync() {
    return repository.getCategories();
  }
}
