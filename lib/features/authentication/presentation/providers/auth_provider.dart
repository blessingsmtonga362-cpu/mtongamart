import 'package:flutter/material.dart';
import '../../../../core/network/api_exceptions.dart';
import '../../data/models/auth_user.dart';
import '../../data/repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _repository;

  AuthUser? _currentUser;
  bool _isLoading = false;
  bool _isInitializing = true;
  String? _errorMessage;
  String? _rememberedEmail;

  AuthProvider({AuthRepository? repository})
      : _repository = repository ?? AuthRepository() {
    initAuth();
  }

  AuthUser? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;
  bool get isEmailVerified => _currentUser?.isEmailVerified ?? false;
  bool get isLoading => _isLoading;
  bool get isInitializing => _isInitializing;
  String? get errorMessage => _errorMessage;
  String? get rememberedEmail => _rememberedEmail;

  Future<void> initAuth() async {
    _isInitializing = true;
    notifyListeners();

    try {
      _rememberedEmail = await _repository.getRememberedEmail();
      final cachedUser = await _repository.getCachedUser();
      final token = await _repository.getAccessToken();

      if (token != null && token.isNotEmpty) {
        _currentUser = cachedUser;
        try {
          _currentUser = await _repository.getCurrentUser();
        } catch (_) {
          // If profile fetch fails, attempt token refresh
          final refreshed = await _repository.refreshTokens();
          if (refreshed != null) {
            _currentUser = await _repository.getCurrentUser();
          } else {
            await _repository.logout();
            _currentUser = null;
          }
        }
      }
    } catch (_) {
      _currentUser = null;
    } finally {
      _isInitializing = false;
      notifyListeners();
    }
  }

  Future<AuthUser?> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      final user = await _repository.signup(
        name: name,
        email: email,
        password: password,
      );
      _setLoading(false);
      return user;
    } on ApiException catch (e) {
      _setError(e.message);
      _setLoading(false);
      rethrow;
    } catch (e) {
      _setError('An unexpected error occurred. Please try again.');
      _setLoading(false);
      rethrow;
    }
  }

  Future<AuthUser?> signin({
    required String email,
    required String password,
    bool rememberEmail = false,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      final user = await _repository.signin(
        email: email,
        password: password,
        rememberEmail: rememberEmail,
      );
      _currentUser = user;
      _setLoading(false);
      notifyListeners();
      return user;
    } on ApiException catch (e) {
      _setError(e.message);
      _setLoading(false);
      rethrow;
    } catch (e) {
      _setError('An unexpected error occurred. Please try again.');
      _setLoading(false);
      rethrow;
    }
  }

  Future<void> logout() async {
    _setLoading(true);
    await _repository.logout();
    _currentUser = null;
    _setLoading(false);
    notifyListeners();
  }

  void updateUserVerificationStatus(bool isVerified) {
    if (_currentUser != null) {
      _currentUser = _currentUser!.copyWith(isEmailVerified: isVerified);
      notifyListeners();
    }
  }

  void clearError() {
    _clearError();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String msg) {
    _errorMessage = msg;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
