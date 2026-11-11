import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic errorData;

  ApiException({
    required this.message,
    this.statusCode,
    this.errorData,
  });

  @override
  String toString() => message;

  factory ApiException.fromResponse(http.Response response) {
    String message = 'An unexpected error occurred. Please try again.';
    dynamic parsedData;

    try {
      if (response.body.isNotEmpty) {
        parsedData = jsonDecode(response.body);
        if (parsedData is Map<String, dynamic>) {
          if (parsedData.containsKey('message')) {
            final rawMessage = parsedData['message'];
            if (rawMessage is List) {
              message = rawMessage.join('\n');
            } else if (rawMessage is String) {
              message = rawMessage;
            }
          } else if (parsedData.containsKey('error') &&
              parsedData['error'] is String) {
            message = parsedData['error'];
          }
        }
      }
    } catch (_) {
      // Ignore JSON decode failures
    }

    if (message == 'An unexpected error occurred. Please try again.') {
      switch (response.statusCode) {
        case 400:
          message = 'Invalid request. Please check your input.';
          break;
        case 401:
          message = 'Unauthorized. Please sign in again.';
          break;
        case 403:
          message = 'Access forbidden. Verification required.';
          break;
        case 404:
          message = 'Requested resource not found.';
          break;
        case 409:
          message = 'An account with this information already exists.';
          break;
        case 429:
          message = 'Too many requests. Please wait a minute before trying again.';
          break;
        case 500:
        case 502:
        case 503:
          message = 'Server error. Please try again later.';
          break;
      }
    }

    return ApiException(
      message: message,
      statusCode: response.statusCode,
      errorData: parsedData,
    );
  }

  factory ApiException.fromNetworkError(dynamic error) {
    String msg = 'Network connection failed. Please check your internet connection.';
    if (error.toString().contains('Timeout') ||
        error.toString().contains('timed out')) {
      msg = 'Connection timed out. Please check your server IP and network.';
    } else if (error.toString().contains('Connection refused') ||
        error.toString().contains('SocketException')) {
      msg = 'Cannot connect to server. Please verify the backend is running.';
    }

    return ApiException(
      message: msg,
      statusCode: null,
      errorData: error,
    );
  }
}
