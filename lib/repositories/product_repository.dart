import 'package:injectable/injectable.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/services/http/http_client.dart';

@Environment('me')
@injectable
class ProductRepository {
  final HttpClient httpClient;

  ProductRepository(this.httpClient);

  Future<List<Product>> getProducts() async {
    final response = await httpClient.get('/products');

    return (response.data as List).map((x) => Product.fromJson(x)).toList();
  }

  Future<List<Product>> search(String query) async {
    final productsRaw = (await httpClient.get(
      '/products',
    ))
        .data as List;

    final products = productsRaw.map((e) => Product.fromJson(e)).toList();

    return products
        .where(
          (element) =>
              element.title.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  Future<List<String>> getCategories() async {
    final categoriesRaw = await httpClient.get(
      '/products/categories',
    );

    final categories = (categoriesRaw.data as List)
        .map(
          (e) => e.toString(),
        )
        .toList();

    return categories;
  }
}

@Environment('hr')
@Injectable(as: ProductRepository)
class HrProductRepository extends ProductRepository {
  HrProductRepository(super.httpClient);

  @override
  Future<List<Product>> getProducts() async {
    return [
      const Product(
        title: 'Test product',
        description: 'Description',
      )
    ];
  }
}
