import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:injectable/injectable.dart';

import 'package:test_proj/blocs/index.dart';
import 'package:test_proj/models/general_models.dart';
import 'package:test_proj/services/index.dart';
import 'options.dart';
import 'token_storage.dart';

@Singleton(scope: 'auth')
class HttpClient {
  late Dio _dio;
  late Fresh<String> _fresh;

  HttpClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: DioOptions.baseUrl,
        receiveTimeout: DioOptions.receiveTimeout,
        connectTimeout: DioOptions.connectTimeout,
      ),
    );

    _fresh = Fresh<String>(
      tokenHeader: (token) => {'Authorization': 'Bearer $token'},
      tokenStorage: SecureTokenStorage(),
      refreshToken: (token, client) {
        getIt<AuthBloc>().add(const AuthEvent.signOut());

        throw Exception('Unauthenticated');
      },
      httpClient: _dio,
    );

    _dio.interceptors.addAll([
      _fresh,
      RetryInterceptor(
        dio: _dio,
        logPrint: print,
      ),
    ]);
  }

  Stream<AuthenticationStatus> get authenticationStatus =>
      _fresh.authenticationStatus;

  Future<void> setToken(String token) {
    return _fresh.setToken(token);
  }

  Future<void> clearToken() {
    return _fresh.clearToken();
  }

  Future<Response<T>> get<T>(
    String url, {
    DynamicMap? queryParameters,
    Options? options,
  }) {
    return _dio.get<T>(url, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> post<T>(
    String url, {
    dynamic data,
    DynamicMap? queryParameters,
    Options? options,
  }) {
    return _dio.post<T>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<T>> put<T>(
    String url, {
    dynamic data,
    DynamicMap? queryParameters,
    Options? options,
  }) {
    return _dio.put<T>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<T>> patch<T>(
    String url, {
    dynamic data,
    DynamicMap? queryParameters,
    Options? options,
  }) {
    return _dio.patch<T>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<T>> delete<T>(
    String url, {
    DynamicMap? queryParameters,
    Options? options,
  }) {
    return _dio.delete<T>(
      url,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> download(String url, String savePath) {
    return _dio.download(url, savePath);
  }
}
