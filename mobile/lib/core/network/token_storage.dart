import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const accessTokenKey = 'access_token';
  // TODO(refresh-token): add refresh_token key when backend supports it.

  final FlutterSecureStorage _storage;

  TokenStorage(this._storage);

  Future<void> write(String key, String value) =>
      _storage.write(key: key, value: value);

  Future<String?> read(String key) => _storage.read(key: key);

  Future<void> delete(String key) => _storage.delete(key: key);

  Future<void> deleteAll() => _storage.deleteAll();
}
