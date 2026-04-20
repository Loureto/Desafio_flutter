import 'dart:async';

import '../../core.dart';

class AuthorizationInterceptor extends HttpInterceptor {
  final ISecureStorageAdapter _secureStorage = SecureStorageAdapter();
  static const String kToken = 'token';
  static const String kRefreshToken = 'refreshToken';

  @override
  FutureOr<HttpOptions> onRequest(HttpOptions request, IHttpClient client) async {
    Map<String, String> headers = Map.from(request.headers ?? {});

    final tokenLoginSecure = await _secureStorage.read('token');

    if (tokenLoginSecure != null) {
      headers['Authorization'] = 'Bearer $tokenLoginSecure';
      request = request.copyWith(headers: headers);
    }

    Log.i('Request: [${request.method}] ${request.url}\nData: ${request.data}');

    return super.onRequest(request, client);
  }

  @override
  FutureOr<HttpResponse> onError(
    HttpOptions request,
    IHttpException exception,
    IHttpClient client,
  ) async {
    Log.i('Message: ${exception.message}\nStatus: ${exception.status}\nData: ${exception.data}');

    if (exception.status?.code == 401 && _shouldRefresh(request)) {
      try {
        await _refreshToken();
        final newToken = await _secureStorage.read(kToken);
        request.headers?['Authorization'] = 'Bearer $newToken';
        request = request.copyWith(path: request.path.replaceAll(Environment.instance.baseUrl, ''));
        return await client.send(request);
      } catch (e) {
        // final logoutHandler = DM.get<IAuthService>();

        // await logoutHandler.logout();
        // Nav.navigate('/auth');
      }
    }

    return super.onError(request, exception, client);
  }

  bool _shouldRefresh(HttpOptions requestOptions) {
    // Avoid refreshing again if it's the refresh token call
    return !requestOptions.path.contains('/refresh');
  }

  Future<void> _refreshToken() async {
    final client = HttpAdapter(baseUrl: Environment.instance.baseUrl);

    final refreshToken = await _secureStorage.read(kRefreshToken);

    try {
      final response = await client.post(
        'app/v1/auth/refresh-token',
        headers: {'Authorization': 'Bearer $refreshToken'},
      );

      if (response.status == HttpStatus.ok) {
        final user = (response.data);
        await _secureStorage.write(kToken, user['token']);
        await _secureStorage.write(kRefreshToken, user['refreshToken']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
