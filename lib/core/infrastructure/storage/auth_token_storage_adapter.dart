import '../../core.dart';

abstract class IAuthTokenStorageAdapter {
  Future<String?> getUserId();

  Future<void> setUserId(String userId);

  Future<String?> getToken();

  Future<void> setToken(String token);

  Future<String?> getRefreshToken();

  Future<void> setRefreshToken(String refreshToken);

  Future<void> saveSession({
    required String userId,
    required String token,
    String? refreshToken,
  });

  Future<void> clearSession();
}

class AuthTokenStorageAdapter implements IAuthTokenStorageAdapter {
  AuthTokenStorageAdapter(this._secureStorage);

  static const _userIdKey = 'userId';
  static const _tokenKey = 'token';
  static const _refreshTokenKey = 'refreshToken';

  final ISecureStorageAdapter _secureStorage;

  @override
  Future<String?> getUserId() {
    return _secureStorage.read(_userIdKey);
  }

  @override
  Future<void> setUserId(String userId) {
    return _secureStorage.write(_userIdKey, userId);
  }

  @override
  Future<String?> getToken() {
    return _secureStorage.read(_tokenKey);
  }

  @override
  Future<void> setToken(String token) {
    return _secureStorage.write(_tokenKey, token);
  }

  @override
  Future<String?> getRefreshToken() {
    return _secureStorage.read(_refreshTokenKey);
  }

  @override
  Future<void> setRefreshToken(String refreshToken) {
    return _secureStorage.write(_refreshTokenKey, refreshToken);
  }

  @override
  Future<void> saveSession({
    required String userId,
    required String token,
    String? refreshToken,
  }) async {
    await setUserId(userId);
    await setToken(token);

    if (refreshToken != null && refreshToken.trim().isNotEmpty) {
      await setRefreshToken(refreshToken);
    }
  }

  @override
  Future<void> clearSession() async {
    await _secureStorage.delete(_userIdKey);
    await _secureStorage.delete(_tokenKey);
    await _secureStorage.delete(_refreshTokenKey);
  }
}
