import 'dart:async';

import '../../data.dart';

abstract class IHttpClient {
  Future<HttpResponse> get(
    String url, {
    Map<String, String>? headers,
    Duration? timeout,
  });

  Future<HttpResponse> post(
    String url, {
    HttpMultipartOptions? httpMultipartOptions,
    Map<String, String>? headers,
    dynamic body,
    Duration? timeout,
  });

  Future<HttpResponse> put(
    String path, {
    HttpMultipartOptions? httpMultipartOptions,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Duration? timeout,
  });

  Future<HttpResponse> patch(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Duration? timeout,
  });

  Future<HttpResponse> delete(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Duration? timeout,
  });

  Future<String> download(
    String url,
    String savePath, {
    Map<String, String>? headers,
    void Function(int received, int total)? onReceiveProgress,
  });

  void addInterceptors(List<HttpInterceptor> interceptors);

  Future<HttpResponse> send(HttpOptions options);
}
