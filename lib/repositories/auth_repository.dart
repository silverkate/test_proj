import 'package:fresh_dio/fresh_dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_proj/services/http/http_client.dart';

@Injectable(scope: 'auth')
class AuthRepository {
  final HttpClient httpClient;

  AuthRepository(this.httpClient);

  Stream<AuthenticationStatus> get authenticationStatus =>
      httpClient.authenticationStatus;

  // TODO(Kate): error handling?
  Future<void> signIn(String userName, String password) => httpClient.post(
        '/auth/login',
        data: {
          'username': userName,
          'password': password,
        },
      ).then((value) {
        final responseMap = value.data as Map<String, dynamic>;

        return httpClient.setToken(responseMap['token'] as String);
      });

  Future<void> signOut() {
    return httpClient.clearToken();
  }
}
