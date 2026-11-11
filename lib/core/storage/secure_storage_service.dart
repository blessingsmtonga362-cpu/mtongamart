import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage(
              aOptions: AndroidOptions(
                encryptedSharedPreferences: true,
              ),
            );

  static const String _keyAccessToken = 'auth_access_token';
  static const String _keyRefreshToken = 'auth_refresh_token';
  static const String _keyRememberedEmail = 'auth_remembered_email';
  static const String _keyUserCache = 'auth_user_cache';

  // Access Token
  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _keyAccessToken, value: token);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _keyAccessToken);
  }

  Future<void> deleteAccessToken() async {
    await _storage.delete(key: _keyAccessToken);
  }

  // Refresh Token
  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _keyRefreshToken, value: token);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _keyRefreshToken);
  }

  Future<void> deleteRefreshToken() async {
    await _storage.delete(key: _keyRefreshToken);
  }

  // Remembered Email
  Future<void> saveRememberedEmail(String email) async {
    await _storage.write(key: _keyRememberedEmail, value: email);
  }

  Future<String?> getRememberedEmail() async {
    return await _storage.read(key: _keyRememberedEmail);
  }

  Future<void> deleteRememberedEmail() async {
    await _storage.delete(key: _keyRememberedEmail);
  }

  // User Cache JSON String
  Future<void> saveUserCache(String userJson) async {
    await _storage.write(key: _keyUserCache, value: userJson);
  }

  Future<String?> getUserCache() async {
    return await _storage.read(key: _keyUserCache);
  }

  Future<void> deleteUserCache() async {
    await _storage.delete(key: _keyUserCache);
  }

  // Clear session tokens & user cache (leaves remembered email intact)
  Future<void> clearAuthSession() async {
    await deleteAccessToken();
    await deleteRefreshToken();
    await deleteUserCache();
  }

  // Clear everything
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
