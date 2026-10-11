import 'package:dio/dio.dart';
import 'package:maki_mobile/core/api/api_exception.dart';

/// Awaits a generated client call and returns its data, throwing the
/// [ApiException] the interceptor attached rather than Dio's wrapper, so
/// callers catch one type.
Future<T> apiCall<T>(Future<Response<T>> call) async {
  try {
    return (await call).data as T;
  } on DioException catch (exception) {
    throw ApiException.fromDioException(exception);
  }
}
