import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fresh_dio/fresh_dio.dart';

import 'package:test_proj/core/constants/index.dart';

class SecureTokenStorage extends TokenStorage<String> {
  static final String _tokenKey = '${AppConstants.appPrefix}Auth_Data';

  final _storage = const FlutterSecureStorage();

  @override
  Future<String?> read() {
    return _storage.read(key: _tokenKey);
  }

  @override
  Future<void> write(String token) {
    return _storage.write(key: _tokenKey, value: token);
  }

  @override
  Future<void> delete() {
    return _storage.delete(key: _tokenKey);
  }
}
