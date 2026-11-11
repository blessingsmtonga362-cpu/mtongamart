import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../storage/secure_storage_service.dart';
import 'api_exceptions.dart';

class ApiClient {
  final http.Client _client;
  final SecureStorageService _storageService;
  final String _baseUrl;

  // Single-flight mutex for refreshing tokens to prevent race conditions
  Completer<bool>? _refreshCompleter;

  ApiClient({
    http.Client? client,
    SecureStorageService? storageService,
    String? baseUrl,
  })  : _client = client ?? http.Client(),
        _storageService = storageService ?? SecureStorageService(),
        _baseUrl = baseUrl ?? ApiConfig.baseUrl;

  Future<Map<String, String>> _buildHeaders({
    bool requiresAuth = true,
    Map<String, String>? extraHeaders,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (requiresAuth) {
      final token = await _storageService.getAccessToken();
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    if (extraHeaders != null) {
      headers.addAll(extraHeaders);
    }

    return headers;
  }

  Uri _parseUri(String path, [Map<String, String>? queryParams]) {
    final fullUrl = path.startsWith('http') ? path : '$_baseUrl$path';
    final uri = Uri.parse(fullUrl);
    if (queryParams != null && queryParams.isNotEmpty) {
      return uri.replace(queryParameters: queryParams);
    }
    return uri;
  }

  Future<dynamic> get(
    String path, {
    Map<String, String>? queryParams,
    bool requiresAuth = true,
    Map<String, String>? headers,
    bool isRetry = false,
  }) async {
    return _sendRequest(
      () async {
        final requestHeaders = await _buildHeaders(
          requiresAuth: requiresAuth,
          extraHeaders: headers,
        );
        final uri = _parseUri(path, queryParams);
        return await _client
            .get(uri, headers: requestHeaders)
            .timeout(ApiConfig.timeout);
      },
      requiresAuth: requiresAuth,
      retryFn: isRetry
          ? null
          : () => get(
                path,
                queryParams: queryParams,
                requiresAuth: requiresAuth,
                headers: headers,
                isRetry: true,
              ),
    );
  }

  Future<dynamic> post(
    String path, {
    dynamic body,
    bool requiresAuth = false,
    Map<String, String>? headers,
    bool isRetry = false,
  }) async {
    return _sendRequest(
      () async {
        final requestHeaders = await _buildHeaders(
          requiresAuth: requiresAuth,
          extraHeaders: headers,
        );
        final uri = _parseUri(path);
        final jsonBody = body != null ? jsonEncode(body) : null;
        return await _client
            .post(uri, headers: requestHeaders, body: jsonBody)
            .timeout(ApiConfig.timeout);
      },
      requiresAuth: requiresAuth,
      retryFn: isRetry
          ? null
          : () => post(
                path,
                body: body,
                requiresAuth: requiresAuth,
                headers: headers,
                isRetry: true,
              ),
    );
  }

  Future<dynamic> put(
    String path, {
    dynamic body,
    bool requiresAuth = true,
    Map<String, String>? headers,
    bool isRetry = false,
  }) async {
    return _sendRequest(
      () async {
        final requestHeaders = await _buildHeaders(
          requiresAuth: requiresAuth,
          extraHeaders: headers,
        );
        final uri = _parseUri(path);
        final jsonBody = body != null ? jsonEncode(body) : null;
        return await _client
            .put(uri, headers: requestHeaders, body: jsonBody)
            .timeout(ApiConfig.timeout);
      },
      requiresAuth: requiresAuth,
      retryFn: isRetry
          ? null
          : () => put(
                path,
                body: body,
                requiresAuth: requiresAuth,
                headers: headers,
                isRetry: true,
              ),
    );
  }

  Future<dynamic> delete(
    String path, {
    dynamic body,
    bool requiresAuth = true,
    Map<String, String>? headers,
    bool isRetry = false,
  }) async {
    return _sendRequest(
      () async {
        final requestHeaders = await _buildHeaders(
          requiresAuth: requiresAuth,
          extraHeaders: headers,
        );
        final uri = _parseUri(path);
        final jsonBody = body != null ? jsonEncode(body) : null;
        return await _client
            .delete(uri, headers: requestHeaders, body: jsonBody)
            .timeout(ApiConfig.timeout);
      },
      requiresAuth: requiresAuth,
      retryFn: isRetry
          ? null
          : () => delete(
                path,
                body: body,
                requiresAuth: requiresAuth,
                headers: headers,
                isRetry: true,
              ),
    );
  }

  Future<dynamic> _sendRequest(
    Future<http.Response> Function() requestFn, {
    required bool requiresAuth,
    Future<dynamic> Function()? retryFn,
  }) async {
    try {
      final response = await requestFn();

      // Check if access token expired on protected request
      if (response.statusCode == 401 && requiresAuth && retryFn != null) {
        final refreshSuccess = await _handleTokenRefresh();
        if (refreshSuccess) {
          return await retryFn();
        } else {
          throw ApiException(
            message: 'Session expired. Please sign in again.',
            statusCode: 401,
          );
        }
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (response.body.isEmpty) return {};
        return jsonDecode(response.body);
      } else {
        throw ApiException.fromResponse(response);
      }
    } on ApiException {
      rethrow;
    } on SocketException catch (e) {
      throw ApiException.fromNetworkError(e);
    } on TimeoutException catch (e) {
      throw ApiException.fromNetworkError(e);
    } on http.ClientException catch (e) {
      throw ApiException.fromNetworkError(e);
    } on FormatException catch (_) {
      throw ApiException(message: 'Invalid data format received from server.');
    } catch (e) {
      throw ApiException.fromNetworkError(e);
    }
  }

  Future<bool> _handleTokenRefresh() async {
    // If a refresh operation is already in progress, wait for it to complete
    if (_refreshCompleter != null && !_refreshCompleter!.isCompleted) {
      return await _refreshCompleter!.future;
    }

    _refreshCompleter = Completer<bool>();

    try {
      final refreshToken = await _storageService.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        await _storageService.clearAuthSession();
        _refreshCompleter!.complete(false);
        return false;
      }

      final uri = Uri.parse('$_baseUrl${ApiConfig.refresh}');
      final response = await _client
          .post(
            uri,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'refreshToken': refreshToken}),
          )
          .timeout(ApiConfig.timeout);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final newAccessToken = data['accessToken']?.toString();
        final newRefreshToken = data['refreshToken']?.toString();

        if (newAccessToken != null && newRefreshToken != null) {
          await _storageService.saveAccessToken(newAccessToken);
          await _storageService.saveRefreshToken(newRefreshToken);
          _refreshCompleter!.complete(true);
          return true;
        }
      }

      // Refresh failed or token reuse detected -> wipe session
      await _storageService.clearAuthSession();
      _refreshCompleter!.complete(false);
      return false;
    } catch (_) {
      await _storageService.clearAuthSession();
      _refreshCompleter!.complete(false);
      return false;
    }
  }
}
