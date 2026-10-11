import 'package:dio/dio.dart';

/// A failed API call, carrying the error envelope's stable [code].
class ApiException implements Exception {
  const ApiException({
    required this.code,
    required this.message,
    this.statusCode,
    this.requestId,
    this.details = const {},
  });

  /// Reads the error envelope. A response without one (a proxy's 502, say)
  /// becomes `internal_error`, and a request that got no response at all
  /// becomes `network`.
  factory ApiException.fromDioException(DioException exception) {
    if (exception.error case final ApiException error) return error;
    final response = exception.response;
    if (response == null) {
      return const ApiException(code: 'network', message: '');
    }
    final body = response.data;
    if (body is Map<String, dynamic> && body['error'] is Map<String, dynamic>) {
      final error = body['error'] as Map<String, dynamic>;
      return ApiException(
        code: error['code'] as String? ?? 'internal_error',
        message: error['message'] as String? ?? '',
        statusCode: response.statusCode,
        requestId: error['request_id'] as String?,
        details: error['details'] as Map<String, dynamic>? ?? const {},
      );
    }
    return ApiException(
      code: 'internal_error',
      message: '',
      statusCode: response.statusCode,
    );
  }

  final String code;

  /// The server's message: safe to show, but only a fallback for a [code]
  /// the app has no translation for.
  final String message;
  final int? statusCode;
  final String? requestId;

  /// Machine-readable extra data, such as a password rule's `min`.
  final Map<String, dynamic> details;

  @override
  String toString() => 'ApiException($code, status: $statusCode)';
}
