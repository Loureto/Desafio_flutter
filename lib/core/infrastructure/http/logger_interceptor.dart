import 'dart:async';
import 'dart:convert';

import '../../core.dart';

class LoggerInterceptor extends HttpInterceptor {
  /// Json encoder to pretty print logs
  final JsonEncoder encoder = const JsonEncoder.withIndent('  ');

  /// Intercept and log responses.
  @override
  FutureOr<HttpResponse> onResponse(
    HttpOptions request,
    HttpResponse response,
  ) {
    Log.i('Response: ${response.status} ${response.status.code}');
    Log.i('Body: ${_encodeData(response.data)}');

    return super.onResponse(request, response);
  }

  /// Intercept and log request errors.
  @override
  FutureOr<HttpResponse> onError(
    HttpOptions request,
    IHttpException exception,
    IHttpClient client,
  ) {
    Log.e('Request error: ${exception.status} ${exception.message}');
    Log.e('Request error data: ${_encodeData(exception.data)}');

    return super.onError(request, exception, client);
  }

  /// Intercept and log the HTTP request being sent.
  @override
  FutureOr<HttpOptions> onRequest(HttpOptions request, IHttpClient client) {
    Log.i(
      [
        'Request: ${request.method} - ${request.url}',
        // if (request.query != null) 'Query: ${request.query}',
        if (request.headers != null) 'Headers: ${_encodeData(request.headers)}',
        if (request.data != null) 'Body: ${_encodeData(request.data)}',
      ].join('\n'),
    );

    return super.onRequest(request, client);
  }

  Object? _encodeData(Object? data) {
    if (data is Map<String, dynamic>) return encoder.convert(data);
    return data;
  }
}
