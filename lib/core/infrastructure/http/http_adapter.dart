import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../core.dart' hide HttpMethod;
import '../../data/interfaces/http/http_method.dart';

class HttpAdapter implements IHttpClient {
  static const _defaultConnectionTimeout = Duration(seconds: 10);

  static const _defaultHeaders = {
    'content-type': 'application/json; charset=utf-8',
    'accept': 'application/json',
  };

  late Dio dio;

  final List<HttpInterceptor> interceptors = [];

  final Map<String, String>? headers;

  final String baseUrl;

  HttpAdapter({required this.baseUrl, this.headers}) {
    if (headers != null) {
      headers?.addAll(headers!);
    } else {
      headers?.addAll(_defaultHeaders);
    }

    dio = Dio(
      BaseOptions(
        connectTimeout: _defaultConnectionTimeout,
        receiveTimeout: _defaultConnectionTimeout,
        headers: headers,
      ),
    );

    _setupInterceptors();
  }

  void _setupInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final urlChunk = options.uri.toString();
          HttpOptions httpOptions = HttpOptions(
            path: urlChunk,
            method: _convertMethod(options.method),
            headers: options.headers.cast<String, String>(),
            data: options.data,
            url: urlChunk,
          );

          for (var interceptor in interceptors) {
            httpOptions = await interceptor.onRequest(httpOptions, this);
          }
          options.headers.remove('content-length');

          options.headers = httpOptions.headers ?? {};
          handler.next(options);
        },
        onResponse: (response, handler) async {
          HttpResponse httpResponse = HttpResponse.success(
            response.data,
            status: HttpStatus.values.firstWhere(
              (status) => status.code == response.statusCode,
            ),
          );
          final urlChunk = response.requestOptions.uri.toString();

          final HttpOptions httpOptions = HttpOptions(
            path: urlChunk,
            method: _convertMethod(response.requestOptions.method),
            headers: response.requestOptions.headers.cast<String, String>(),
            data: response.requestOptions.data,
            url: urlChunk,
          );

          for (var interceptor in interceptors) {
            httpResponse = await interceptor.onResponse(
              httpOptions,
              httpResponse,
            );
          }

          handler.next(response);
        },
        onError: (DioException e, handler) async {
          final requestOptions = e.requestOptions;
          final urlChunk = requestOptions.uri.toString();

          final HttpOptions httpOptions = HttpOptions(
            path: urlChunk,
            method: _convertMethod(requestOptions.method),
            headers: requestOptions.headers.cast<String, String>(),
            data: requestOptions.data,
            url: urlChunk,
          );

          final IHttpException exception = _handleError(e);

          for (final interceptor in interceptors) {
            try {
              final response = await interceptor.onError(
                httpOptions,
                exception,
                this,
              );

              handler.resolve(
                Response(
                  requestOptions: requestOptions,
                  data: response.data,
                  statusCode: response.status.code,
                ),
              );
              return;
            } catch (err) {
              exception;
            }
          }

          handler.next(e);
        },
      ),
    );
  }

  @override
  Future<HttpResponse> get(
    String path, {
    Map<String, String>? headers,
    Duration? timeout = _defaultConnectionTimeout,
  }) async {
    return _handleRequest(
      HttpOptions(
        method: HttpMethod.get,
        path: path,
        headers: headers,
        timeout: timeout,
      ),
    );
  }

  @override
  Future<HttpResponse> post(
    String path, {
    HttpMultipartOptions? httpMultipartOptions,
    Map<String, String>? headers,
    dynamic body,
    Duration? timeout = _defaultConnectionTimeout,
  }) async {
    return _handleRequest(
      HttpOptions(
        method: HttpMethod.post,
        path: path,
        headers: headers,
        data: body,
        timeout: timeout,
      ),
    );
  }

  @override
  Future<HttpResponse> put(
    String path, {
    HttpMultipartOptions? httpMultipartOptions,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Duration? timeout = _defaultConnectionTimeout,
  }) async {
    return _handleRequest(
      HttpOptions(
        method: HttpMethod.put,
        path: path,
        headers: headers,
        data: body,
        timeout: timeout,
      ),
    );
  }

  @override
  Future<HttpResponse> delete(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Duration? timeout = _defaultConnectionTimeout,
  }) async {
    return _handleRequest(
      HttpOptions(
        method: HttpMethod.delete,
        path: path,
        headers: headers,
        data: body,
        timeout: timeout,
      ),
    );
  }

  @override
  Future<HttpResponse> patch(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Duration? timeout = _defaultConnectionTimeout,
  }) async {
    return _handleRequest(
      HttpOptions(
        method: HttpMethod.patch,
        path: path,
        headers: headers,
        data: body,
        timeout: timeout,
      ),
    );
  }

  Future<HttpResponse> _handleRequest(HttpOptions httpOptions) async {
    try {
      final url = baseUrl + httpOptions.path;

      log('URL: $url');

      final Response response = await dio.request(
        url,
        options: Options(
          method: _convertMethodToString(httpOptions.method),
          headers: httpOptions.headers ?? _defaultHeaders,
        ),
        data: httpOptions.data,
      );

      return HttpResponse.success(
        response.data,
        status: _getHttpStatus(response.statusCode),
      );
    } on DioException catch (e) {
      throw _handleError(e);
    } catch (error, stacktrace) {
      Log.e(error.toString(), error, stacktrace);

      throw DomainException(exception: error.toString());
    }
  }

  HttpStatus _getHttpStatus(int? code) {
    return HttpStatus.values.firstWhere(
      (status) => status.code == code,
      orElse: () => HttpStatus.internalServerError,
    );
  }

  IHttpException _handleError(DioException e) {
    // TIMEOUT (rede)
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return TimeoutException(message: e.response?.statusMessage ?? '');
    }

    // ERRO HTTP (status code veio do servidor)
    if (e.type == DioExceptionType.badResponse) {
      final status = _getHttpStatus(e.response?.statusCode);

      switch (status) {
        case HttpStatus.badRequest:
          return BadRequestException(
            message: e.response?.statusMessage ?? '',
            data: e.response?.data,
          );

        case HttpStatus.forbidden:
          return ForbiddenException(
            message: e.response?.statusMessage ?? '',
            data: e.response?.data,
          );

        case HttpStatus.notFound:
          return NotFoundException(message: e.response?.statusMessage ?? '');

        case HttpStatus.unprocessableEntity:
          return UnprocessableEntityException(
            message: e.response?.statusMessage ?? '',
            data: e.response?.data,
          );

        case HttpStatus.unauthorized:
          return UnauthorizedException(
            message: e.response?.statusMessage ?? '',
            data: e.response?.data,
          );

        case HttpStatus.internalServerError:
          return InternalServerErrorException(
            message: e.response?.statusMessage ?? '',
          );

        default:
          return InternalServerErrorException(
            message: e.response?.statusMessage ?? '',
          );
      }
    }

    // ERRO DE CONEXÃO (sem resposta)
    if (e.type == DioExceptionType.connectionError) {
      return TimeoutException(message: e.response?.statusMessage ?? '');
    }

    // QUALQUER OUTRO ERRO INESPERADO
    return InternalServerErrorException(message: e.message ?? '');
  }

  HttpMethod _convertMethod(String method) => switch (method.toUpperCase()) {
    'GET' => HttpMethod.get,
    'POST' => HttpMethod.post,
    'PUT' => HttpMethod.put,
    'PATCH' => HttpMethod.patch,
    'DELETE' => HttpMethod.delete,
    _ => HttpMethod.get,
  };

  String _convertMethodToString(HttpMethod method) => switch (method) {
    HttpMethod.get => 'GET',
    HttpMethod.post => 'POST',
    HttpMethod.put => 'PUT',
    HttpMethod.patch => 'PATCH',
    HttpMethod.delete => 'DELETE',
  };

  @override
  void addInterceptors(List<HttpInterceptor> interceptors) {
    this.interceptors.addAll(interceptors);
  }

  @override
  Future<HttpResponse> send(HttpOptions options) async {
    return _handleRequest(options);
  }

  @override
  Future<String> download(
    String url,
    String savePath, {
    Map<String, String>? headers,
    void Function(int received, int total)? onReceiveProgress,
  }) async {
    try {
      await dio.download(url, savePath);
      return savePath;
    } on DioException catch (e) {
      throw _handleError(e);
    } catch (error, stacktrace) {
      Log.e(error.toString(), error, stacktrace);
      throw DomainException(exception: error.toString());
    }
  }

  static HttpAdapter httpClientBuilder({
    String? baseUrl,
    Map<String, String>? headers,
  }) {
    return HttpAdapter(baseUrl: baseUrl ?? '', headers: headers)
      ..addInterceptors([
        if (kDebugMode) LoggerInterceptor(),
        AuthorizationInterceptor(),
      ]);
  }
}
