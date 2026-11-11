import 'dart:convert';
import '../../../../core/storage/secure_storage_service.dart';
import '../models/auth_tokens.dart';
import '../models/auth_user.dart';
import '../services/auth_api_service.dart';

class AuthRepository {
  final AuthApiService _apiService;
  final SecureStorageService _storageService;

  AuthRepository({
    AuthApiService? apiService,
    SecureStorageService? storageService,
  })  : _apiService = apiService ?? AuthApiService(),
        _storageService = storageService ?? SecureStorageService();

  Future<AuthUser> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _apiService.signup(
      name: name,
      email: email,
      password: password,
    );

    final userData = response['user'] as Map<String, dynamic>;
    return AuthUser.fromJson(userData);
  }

  Future<AuthUser> signin({
    required String email,
    required String password,
    bool rememberEmail = false,
  }) async {
    final response = await _apiService.signin(
      email: email,
      password: password,
    );

    final tokens = AuthTokens.fromJson(response);
    final user = AuthUser.fromJson(response['user'] as Map<String, dynamic>);

    await _storageService.saveAccessToken(tokens.accessToken);
    await _storageService.saveRefreshToken(tokens.refreshToken);
    await _storageService.saveUserCache(jsonEncode(user.toJson()));

    if (rememberEmail) {
      await _storageService.saveRememberedEmail(email.trim().toLowerCase());
    } else {
      await _storageService.deleteRememberedEmail();
    }

    return user;
  }

  Future<String?> getRememberedEmail() async {
    return await _storageService.getRememberedEmail();
  }

  Future<AuthTokens?> refreshTokens() async {
    final refreshToken = await _storageService.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      return null;
    }

    final tokens = await _apiService.refresh(refreshToken: refreshToken);
    await _storageService.saveAccessToken(tokens.accessToken);
    await _storageService.saveRefreshToken(tokens.refreshToken);
    return tokens;
  }

  Future<void> logout() async {
    try {
      final refreshToken = await _storageService.getRefreshToken();
      if (refreshToken != null && refreshToken.isNotEmpty) {
        await _apiService.logout(refreshToken: refreshToken);
      }
    } catch (_) {
      // Ignore network errors on logout to ensure local wipe always succeeds
    } finally {
      await _storageService.clearAuthSession();
    }
  }

  Future<AuthUser> getCurrentUser() async {
    final user = await _apiService.getMe();
    await _storageService.saveUserCache(jsonEncode(user.toJson()));
    return user;
  }

  Future<AuthUser?> getCachedUser() async {
    final cached = await _storageService.getUserCache();
    if (cached != null && cached.isNotEmpty) {
      try {
        return AuthUser.fromJson(jsonDecode(cached));
      } catch (_) {}
    }
    return null;
  }

  Future<String?> getAccessToken() async {
    return await _storageService.getAccessToken();
  }

  Future<String?> getRefreshToken() async {
    return await _storageService.getRefreshToken();
  }
}
