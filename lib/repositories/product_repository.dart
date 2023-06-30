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

  Future<List<Product>> search(String query) async {
    final productsRaw = (await httpClient.get(
      '/products',
    ))
        .data as List;

    final products = productsRaw.map((e) => Product.fromJson(e)).toList();

    return products
        .where(
          (element) =>
              element.title?.toLowerCase().contains(query.toLowerCase()) ??
              false,
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

  // Future<List<Product>> getProductsByCategory(String category) async {
  //   final productsRaw = (await httpClient.get(
  //     '/products',
  //   ))
  //       .data as List;
  //
  //   final products = productsRaw.map((e) => Product.fromJson(e)).toList();
  //
  //   return products
  //       .where((element) =>
  //           element.category?.toLowerCase() == category.toLowerCase())
  //       .toList();
  // }
}
