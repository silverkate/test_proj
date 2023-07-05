import 'package:injectable/injectable.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/services/http/http_client.dart';

@injectable
class CartsRepository {
  final HttpClient httpClient;

  CartsRepository(this.httpClient);

  Future<List<Cart>> getCarts() async {
    final response = await httpClient.get('/carts');

    return (response.data as List).map((x) => Cart.fromJson(x)).toList();
  }
}
