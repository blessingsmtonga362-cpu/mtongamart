import '../../../../core/config/api_config.dart';
import '../../../../core/network/api_client.dart';
import '../models/auth_tokens.dart';
import '../models/auth_user.dart';

class AuthApiService {
  final ApiClient _apiClient;

  AuthApiService({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  /// POST /auth/signup
  Future<Map<String, dynamic>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _apiClient.post(
      ApiConfig.signup,
      body: {
        'name': name.trim(),
        'email': email.trim().toLowerCase(),
        'password': password,
      },
      requiresAuth: false,
    );

    return response as Map<String, dynamic>;
  }

  /// POST /auth/signin
  Future<Map<String, dynamic>> signin({
    required String email,
    required String password,
  }) async {
    final response = await _apiClient.post(
      ApiConfig.signin,
      body: {
        'email': email.trim().toLowerCase(),
        'password': password,
      },
      requiresAuth: false,
    );

    return response as Map<String, dynamic>;
  }

  /// POST /auth/resend-verification
  Future<Map<String, dynamic>> resendVerification({
    required String email,
  }) async {
    final response = await _apiClient.post(
      ApiConfig.resendVerification,
      body: {
        'email': email.trim().toLowerCase(),
      },
      requiresAuth: false,
    );

    return response as Map<String, dynamic>;
  }

  /// GET /auth/verify-email?token=...
  Future<Map<String, dynamic>> verifyEmail({
    required String token,
  }) async {
    final response = await _apiClient.get(
      ApiConfig.verifyEmail,
      queryParams: {'token': token},
      requiresAuth: false,
    );

    return response as Map<String, dynamic>;
  }

  /// POST /auth/forgot-password
  Future<Map<String, dynamic>> forgotPassword({
    required String email,
  }) async {
    final response = await _apiClient.post(
      ApiConfig.forgotPassword,
      body: {
        'email': email.trim().toLowerCase(),
      },
      requiresAuth: false,
    );

    return response as Map<String, dynamic>;
  }

  /// POST /auth/reset-password
  Future<Map<String, dynamic>> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    final response = await _apiClient.post(
      ApiConfig.resetPassword,
      body: {
        'token': token,
        'newPassword': newPassword,
      },
      requiresAuth: false,
    );

    return response as Map<String, dynamic>;
  }

  /// POST /auth/refresh
  Future<AuthTokens> refresh({
    required String refreshToken,
  }) async {
    final response = await _apiClient.post(
      ApiConfig.refresh,
      body: {
        'refreshToken': refreshToken,
      },
      requiresAuth: false,
    );

    return AuthTokens.fromJson(response as Map<String, dynamic>);
  }

  /// POST /auth/logout
  Future<void> logout({
    required String refreshToken,
  }) async {
    await _apiClient.post(
      ApiConfig.logout,
      body: {
        'refreshToken': refreshToken,
      },
      requiresAuth: false,
    );
  }

  /// GET /user/me
  Future<AuthUser> getMe() async {
    final response = await _apiClient.get(
      ApiConfig.userMe,
      requiresAuth: true,
    );

    return AuthUser.fromJson(response as Map<String, dynamic>);
  }
}
