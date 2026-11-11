class ApiConfig {
  static const String baseUrl = 'http://192.168.1.219:3000';
  static const Duration timeout = Duration(seconds: 15);

  // Auth endpoints
  static const String signup = '/auth/signup';
  static const String signin = '/auth/signin';
  static const String verifyEmail = '/auth/verify-email';
  static const String resendVerification = '/auth/resend-verification';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';
  static const String refresh = '/auth/refresh';
  static const String logout = '/auth/logout';

  // User profile endpoint
  static const String userMe = '/user/me';
}
