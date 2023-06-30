import 'package:injectable/injectable.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/services/http/http_client.dart';

@injectable
class ProductRepository {
  final HttpClient httpClient;

  ProductRepository(this.httpClient);

  Future<List<Product>> getProducts() async {
    final products = (await httpClient.get(
      '/products',
    ))
        .data as List;

    return products.map((e) => Product.fromJson(e)).toList();
  }
}
