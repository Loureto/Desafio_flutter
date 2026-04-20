import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';

abstract class IAuthRemoteDataSource {
  Future<AccountModel> signIn(String email, String password);

  Future<Unit> signUp(String email, String password);
}

class AuthRemoteDataSource implements IAuthRemoteDataSource {
  final IHttpClient _httpClient;

  const AuthRemoteDataSource(this._httpClient);

  @override
  Future<AccountModel> signIn(String email, String password) async {
    final response = await _httpClient.post(
      ApiConstants.signIn,
      body: AccountModel.toJson(email, password),
    );
    return AccountModel.fromJson(response.data);
  }

  @override
  Future<Unit> signUp(String email, String password) async {
    await _httpClient.post(
      ApiConstants.signUp,
      body: AccountModel.toJson(email, password),
    );
    return unit;
  }
}
