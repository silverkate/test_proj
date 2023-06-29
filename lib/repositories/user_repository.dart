import 'package:injectable/injectable.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/services/http/http_client.dart';

@Injectable(scope: 'auth')
class UserRepository {
  final HttpClient httpClient;

  UserRepository(this.httpClient);

  Future<UserProfile?> getUserProfile(int id) => httpClient
          .get(
        '/users/$id',
      )
          .then((value) {
        return UserProfile.fromJson(value.data);
      });
}
