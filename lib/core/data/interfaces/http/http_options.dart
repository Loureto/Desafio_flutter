import 'http_method.dart';

/// HTTP request options
class HttpOptions {
  /// Http path
  final String path;

  /// Http method
  final HttpMethod method;

  /// Http url
  final String url;

  /// Http data
  final dynamic data;

  /// Http headers
  final Map<String, String>? headers;

  final Duration? timeout;

  ///
  /// Creates a new [HttpOptions]
  ///
  HttpOptions({required this.path, required this.method, this.url = '', this.data, this.headers, this.timeout});

  /// Returns a callable class that can be used as follows: `httpOptions.copyWith(...)`.
  HttpOptions copyWith({String? path, HttpMethod? method, String? url, dynamic data, Map<String, String>? headers, Duration? timeout}) {
    return HttpOptions(
      path: path ?? this.path,
      method: method ?? this.method,
      url: url ?? this.url,
      data: data ?? this.data,
      headers: headers ?? this.headers,
      timeout: timeout ?? this.timeout,
    );
  }
}
